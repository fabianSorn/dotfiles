local module = { }

function module.background()
  local color = vim.fn.system("defaults read -g AppleInterfaceStyle")
  if string.match(color, ".*Dark.*") then
    return "dark"
  else
    return "light"
  end
end

return module

