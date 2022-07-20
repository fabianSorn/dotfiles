local utils = { }

function utils.try_cmd(command, error)
  local status_ok, return_value = pcall(vim.cmd, command)
  if not status_ok then
    vim.notify("Could not execute vim cmd " ..command ..", " ..error)
    return
  else
    return return_value
  end

end

return utils

