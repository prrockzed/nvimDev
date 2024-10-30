local M = {}

-- Customizable auto-commit message
local default_commit_message = "Auto-commit: Staging changes before rebase"

-- Helper function to run Git commands with callbacks
local function run_git_command(command, args, success_callback, failure_callback)
  local job = vim.fn.jobstart({ "git", command, unpack(args or {}) }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if data then
        for _, line in ipairs(data) do
          if line ~= "" then
            vim.notify(line, vim.log.levels.INFO)
          end
        end
      end
    end,
    on_stderr = function(_, data)
      if data then
        for _, line in ipairs(data) do
          if line ~= "" then
            vim.notify("Git Error: " .. line, vim.log.levels.ERROR)
          end
        end
      end
    end,
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        if success_callback then success_callback() end
      else
        if failure_callback then failure_callback(exit_code) end
      end
    end
  })
  
  if job <= 0 then
    vim.notify("Failed to start Git command: " .. command, vim.log.levels.ERROR)
    if failure_callback then failure_callback() end
  end
end

-- Git add command
local function git_add(success_callback, failure_callback)
  run_git_command("add", { "." }, success_callback, failure_callback)
end

-- Git commit command
local function git_commit(commit_message, success_callback, failure_callback)
  local message = commit_message ~= nil and commit_message or default_commit_message
  run_git_command("commit", { "-m", message }, success_callback, failure_callback)
end

-- Git pull command
local function git_pull(success_callback, failure_callback)
  run_git_command("pull", { "--rebase" }, success_callback, failure_callback)
end

-- Check for unstaged, untracked, and staged changes
local function check_for_git_changes()
  local handle = io.popen("git status --porcelain")
  local result = handle:read("*a")
  handle:close()
  
  local untracked = result:match("??")
  local modified_not_staged = result:match("^ M")
  local staged = result:match("^M")

  return {
    has_changes = result ~= "",
    untracked = untracked,
    modified_not_staged = modified_not_staged,
    staged = staged
  }
end

-- Function to stage and commit changes
local function stage_and_commit_changes(callback)
  vim.notify("Staging your changes...", vim.log.levels.INFO)
  
  git_add(function()
    vim.ui.input({
      prompt = "Enter a commit message (leave blank for auto-commit): ",
    }, function(input)
      local commit_message = input ~= nil and input ~= "" and input or default_commit_message
      
      git_commit(commit_message, function()
        vim.notify("Changes successfully committed with message: " .. commit_message, vim.log.levels.INFO)
        callback()
      end, function(exit_code)
        vim.notify("Failed to commit changes (exit code: " .. exit_code .. ").", vim.log.levels.ERROR)
        vim.ui.select({ "Retry", "Abort" }, { prompt = "Do you want to retry?" }, function(choice)
          if choice == "Retry" then
            stage_and_commit_changes(callback)
          end
        end)
      end)
    end)
  end, function()
    vim.notify("Failed to stage changes.", vim.log.levels.ERROR)
  end)
end

-- Function to pull latest changes
local function pull_latest_changes()
  vim.notify("Pulling latest changes...", vim.log.levels.INFO)
  
  git_pull(function()
    vim.notify("nvimDev updated! Happy coding!", vim.log.levels.INFO)
  end, function(exit_code)
    if exit_code == 1 then
      vim.notify("Merge conflicts detected. Please resolve conflicts and try again.", vim.log.levels.ERROR)
    else
      vim.notify("Failed to update nvimDev (exit code: " .. exit_code .. ").", vim.log.levels.ERROR)
    end
    
    vim.ui.select({ "Retry", "Abort" }, { prompt = "Do you want to retry the pull?" }, function(choice)
      if choice == "Retry" then
        pull_latest_changes()
      end
    end)
  end)
end

-- Main function to update with Git
M.update_with_git = function()
  local changes = check_for_git_changes()

  if changes.has_changes then
    local change_message = "Unstaged changes detected!"
    
    if changes.untracked then
      change_message = change_message .. "\nUntracked files are present."
    end
    if changes.modified_not_staged then
      change_message = change_message .. "\nModified but not staged files are present."
    end
    if changes.staged then
      change_message = change_message .. "\nStaged but not committed changes are present."
    end
    
    vim.ui.input({
      prompt = change_message .. "\nAuto stage and commit? (You will be prompted for a commit message) (y/n): ",
      default = "",
    }, function(input)
      if input == "y" then
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
