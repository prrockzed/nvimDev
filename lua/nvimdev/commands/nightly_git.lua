local M = {}

-- Helper function to run Git commands with callbacks
local function run_git_command(command, args, success_callback, failure_callback)
  vim.fn.jobstart({ "git", command, unpack(args or {}) }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        for _, line in ipairs(data) do
          if line ~= "" then
            vim.notify(line, vim.log.levels.INFO)
          end
        end
      end
    end,
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        if success_callback then success_callback() end
      else
        if failure_callback then failure_callback() end
      end
    end
  })
end

-- Function to check for unstaged changes
local function check_for_unstaged_changes()
  local handle = io.popen("git status --porcelain")
  local result = handle:read("*a")
  handle:close()
  return result ~= ""
end

-- Function to stage and commit changes
local function stage_and_commit_changes(callback)
  vim.notify("Staging your changes...", vim.log.levels.INFO)

  -- First stage the changes
  run_git_command("add", { "." }, function()
    -- Ask the user for a commit message
    vim.ui.input({
      prompt = "Enter a commit message (leave blank for auto-commit): ",
    }, function(input)
      local commit_message = input ~= nil and input ~= "" and input or "Auto-commit: Staging changes before rebase"
      
      -- Commit the changes
      run_git_command("commit", { "-m", commit_message }, function()
        vim.notify("Changes successfully committed with message: " .. commit_message, vim.log.levels.INFO)
        callback()
      end, function()
        vim.notify("Failed to commit changes.", vim.log.levels.ERROR)
      end)
    end)
  end)
end

-- Function to pull latest changes
local function pull_latest_changes()
  vim.notify("Pulling latest changes...", vim.log.levels.INFO)
  
  run_git_command("pull", { "--rebase" }, function()
    vim.notify("nvimDev updated! Happy coding!", vim.log.levels.INFO)
  end, function()
    vim.notify("Failed to update nvimDev.", vim.log.levels.ERROR)
  end)
end

-- Main function to update with Git
M.update_with_git = function()
  -- Check for unstaged changes
  if check_for_unstaged_changes() then
    vim.ui.input({
      prompt = "Unstaged changes detected!\nAuto stage and commit (You will be prompted for a commit message)? (y/n): ",
      default = "",
    }, function(input)
      if input == "y" then
        -- Stage and commit changes, then proceed with pulling updates
        stage_and_commit_changes(function()
          pull_latest_changes()
        end)
      else
        vim.notify("Please manually stage your changes before proceeding.", vim.log.levels.ERROR)
      end
    end)
  else
    -- No unstaged changes, pull the latest changes
    pull_latest_changes()
  end
end

return M
