local wezterm = require "wezterm"

-- Exceute command, parse the output and return it
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
  local interfaceStyle = execute("defaults read -g AppleInterfaceStyle")
  return string.match(interfaceStyle, ".*Dark.*")
end

local function use_dark()
    if wezterm.target_triple == ".*windows.*" then 
        return use_dark_win()
    elseif string.match(wezterm.target_triple, ".*apple.*") then
        return use_dark_macos()
    else
        return true
    end
end

-- Source for the colors: https://github.com/enkia/tokyo-night-vscode-theme#color-palette
local tokyonight = {
  -- Dark colorway
  storm = {
    colors = {
        tab_bar = {
            background = "#24283b",
            active_tab = {
                bg_color = "#7aa2f7",
                fg_color = "#24283b",
                intensity = "Bold"
            },
            inactive_tab = {
                bg_color = "#24283b",
                fg_color = "#a9b1d6",
            },
            new_tab = {
                bg_color = "#24283b",
                fg_color = "#a9b1d6",
            },
            inactive_tab_hover = {
                bg_color = "#414868",
                fg_color = "#a9b1d6",
            },
            new_tab_hover = {
                bg_color = "#414868",
                fg_color = "#a9b1d6",
            },
        },
    },
  },
  -- Light colorway
  day = {
    colors = {
        tab_bar = {
            background = "#d5d6db",
            active_tab = {
                bg_color = "#34548a",
                fg_color = "#d5d6db",
                intensity = "Bold"
            },
            inactive_tab = {
                bg_color = "#d5d6db",
                fg_color = "#343b58",
            },
            new_tab = {
                bg_color = "#d5d6db",
                fg_color = "#343b58",
            },
            inactive_tab_hover = {
                bg_color = "#9699a3",
                fg_color = "#343b58",
            },
            new_tab_hover = {
                bg_color = "#9699a3",
                fg_color = "#343b58",
            },
        },
    },
  }
}

return {
  font = wezterm.font "Hack Nerd Font Mono",
  color_scheme = use_dark() and "TokyoNightStorm (Gogh)" or "TokyoNightLight (Gogh)",
  use_fancy_tab_bar = false,
  font_size = 14.0,
  colors = use_dark() and tokyonight.storm.colors or tokyonight.day.colors ,
  exit_behavior = "Close",
  keys = {
    -- CTRL-SHIFT-ö activates the debug overlay
    -- wezterm.log_info() allows printing infos to that log
    { key = "Ö", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
  },
}
