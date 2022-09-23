local module = { }

function module.in_wsl()
  if not vim.fn.has("unix") == 0 then
    local has_win_mount = string.find(vim.fn.system("echo %$PATH"), "/mnt/c/WINDOWS")
    if has_win_mount then
      return true
    end
  end
  return false
end

function module.in_windows()
  return not vim.fn.has("win64") == 0 or not vim.fn.has("win32") == 0
end

function module.in_macos()
  return not vim.fn.has("macunix") == 0
end

-- TODO: check if this works in linux
function module.in_linux()
  return not vim.fn.has("unix") == 0 and not module.in_wsl()
end

function module.background()
  if module.in_macos() then
      return mac_background()
  elseif module.in_windows() then
      return win_background()
  elseif module.in_wsl() then
      return wsl_background()
  elseif module.in_linux() then
      return linux_background()
  else
    return "dark"
  end
end

-- ============================= Utility functions =============================

function win_background()
  local useLightTheme = vim.fn.system("powershell.exe -noprofile -nologo -noninteractive \"$a = Get-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize; $a.AppsUseLightTheme\"")
  if string.match(useLightTheme, "0") then
    return "dark"
  else
    return "light"
  end
end

function wsl_background()
  local useLightTheme = vim.fn.system("powershell.exe -noprofile -nologo -noninteractive '$a = Get-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize; $a.AppsUseLightTheme'")
  if string.match(useLightTheme, "0") then
    return "dark"
  else
    return "light"
  end
end

function mac_background()
  local color = vim.fn.system("defaults read -g AppleInterfaceStyle")
  if string.match(color, ".*Dark.*") then
    return "dark"
  else
    return "light"
  end
end

function linux_background()
  -- TODO: implement? could be highly dependabel on desktop environment
  return "dark"
end

return module

