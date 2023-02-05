local wezterm = require "wezterm"

local function execute(command)
    local handle = io.popen(command)
    if handle ~= nil then
        local result = handle:read("*a")
        handle:close()
        return result
    else
        return ""
    end
end

local function use_dark_win()
  local useLightTheme = execute("powershell.exe -noprofile -nologo -noninteractive '$a = Get-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize; $a.AppsUseLightTheme'")
  return string.match(useLightTheme, "0")
end

local function use_dark_macos()
  local useLightTheme = execute("defaults read -g AppleInterfaceStyle")
  return string.match(useLightTheme, ".*Dark.*")
end

local function use_dark()
    if wezterm.target_triple == ".*windows.*" then 
        wezterm.log_info("Detected windows platform")
        return use_dark_win()
    elseif string.match(wezterm.target_triple, ".*apple.*") then
        wezterm.log_info("Detected mac platform")
        return use_dark_macos()
    else
        wezterm.log_info("Neither windows not mac")
        return true
    end
end

-- Additional parts of the configuration

local function color_scheme()
    if use_dark() then
        return "tokyonight"
    else
        return "tokyonight-day"
    end
end

return {
  font = wezterm.font "Hack Nerd Font Mono",
  color_scheme = color_scheme(),
  keys = {
    -- CTRL-SHIFT-l activates the debug overlay
    { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
  },
}
