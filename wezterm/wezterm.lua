local wezterm = require "wezterm"

local function use_dark()
  return wezterm.gui.get_appearance():match "Dark.*"
end

local function default_prog()
    if wezterm.target_triple:match ".*windows.*" then
        return { "C:/Program Files/Git/bin/bash.exe", "--login" }
    elseif wezterm.target_triple:match ".*apple.*" then
        return { "/usr/bin/zsh", "--login" }
    else
        return { "/usr/bin/bash", "--login" }
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
  default_prog = default_prog(),
  use_fancy_tab_bar = false,
  font_size = 14.0,
  colors = use_dark() and tokyonight.storm.colors or tokyonight.day.colors ,
  exit_behavior = "Close",
  keys = {
    -- CTRL-SHIFT-l activates the debug overlay
    -- wezterm.log_info() allows printing infos to that log
    { key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
  },
}
