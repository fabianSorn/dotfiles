local utils = { }

function utils.try_cmd(command, error)
  local status_ok, _ = pcall(vim.cmd, command)
  if not status_ok then
    vim.notify("Failed to execute vim cmd " ..command ..", " ..error)
    return
  end
end

return utils

