local M = {}

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
  vim.fn.jobstart({ "git", "add", "." }, {
    on_exit = function()
      -- Ask the user for a commit message
      vim.ui.input({
        prompt = "Enter a commit message (leave blank for auto-commit): ",
      }, function(input)
        local commit_message = input ~= nil and input ~= "" and input or "Auto-commit: Staging changes before rebase"
        
        -- Commit the changes
        vim.fn.jobstart({ "git", "commit", "-m", commit_message }, {
          on_exit = function(_, commit_exit_code)
            if commit_exit_code == 0 then
              vim.notify("Changes successfully committed with message: " .. commit_message, vim.log.levels.INFO)
              callback()
            else
              vim.notify("Failed to commit changes.", vim.log.levels.ERROR)
            end
          end
        })
      end)
    end
  })
end

-- Function to update nvimDev with Git
M.update_with_git = function()
  -- Check for unstaged changes
  if check_for_unstaged_changes() then
    vim.ui.input({
      prompt = "Unstaged changes detected!\nWould you like to automatically stage and commit them? (y/n): ",
      default = "",
    }, function(input)
      if input == "y" then
        -- Stage and commit changes, then proceed with the pull
        stage_and_commit_changes(function()
          M.update_with_git()
        end)
      else
        vim.notify("Please manually stage your changes before proceeding.", vim.log.levels.ERROR)
      end
    end)
  else
    -- No unstaged changes, pull the latest changes
    vim.notify("Pulling latest changes...")

    local changes = 1
    vim.fn.jobstart({ "git", "pull", "--rebase" }, {
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
          changes = 0
          vim.notify("nvimDev updated! Happy coding!", vim.log.levels.INFO)
        else
          changes = 0
          vim.notify("Failed to update nvimDev.", vim.log.levels.ERROR)
        end
      end,
    })
    if changes then
      vim.notify("No updates required. You are already updated!")
    end
  end
end

return M
