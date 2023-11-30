local wezterm = require("wezterm")
local mux = wezterm.mux
local wsl_domains = wezterm.default_wsl_domains()
local default_domain = wsl_domains[1]

wezterm.on(
  "gui-startup",
  function(cmd)
    local window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
  end
)

local custom_colorschemes = {
  ['Melange'] = {
    foreground    = "#ECE1D7",
    background    = "#292522",
    cursor_bg     = "#ECE1D7",
    cursor_border = "#ECE1D7",
    cursor_fg     = "#292522",
    selection_bg  = "#403A36",
    selection_fg  = "#ECE1D7",
    ansi          = {
      "#34302C",
      "#BD8183",
      "#78997A",
      "#E49B5D",
      "#7F91B2",
      "#B380B0",
      "#7B9695",
      "#C1A78E"
    },
    brights       = {
      "#867462",
      "#D47766",
      "#85B695",
      "#EBC06D",
      "#A3A9CE",
      "#CF9BC2",
      "#89B3B6",
      "#ECE1D7"
    },
  },
}

return {
  default_domain = default_domain.name,
  hide_tab_bar_if_only_one_tab = true,
  color_schemes = custom_colorschemes,
  -- color_scheme = "Gruvbox dark, hard (base16)",
  -- color_scheme = "Catppuccin Macchiato",
  -- color_scheme = "Melange",
  color_scheme = "Night Owl (Gogh)",
  -- font = wezterm.font("DankMono Nerd Font Bold"),
  font = wezterm.font("JetBrainsMono Nerd Font"),
  -- font_size = 11,
  font_size = 11,
  window_close_confirmation = "NeverPrompt",
  -- window_background_opacity = 0,
  -- win32_system_backdrop = "Mica",
  -- window_decorations = "RESIZE",
  leader = { key = "a", mods = "CTRL" },
  keys = {
    { key = "a", mods = "LEADER|CTRL", action = wezterm.action { SendString = "\x01" } },
    { key = "-", mods = "LEADER",      action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    {
      key = "\\",
      mods = "LEADER",
      action = wezterm.action { SplitHorizontal = {
        domain =
        "CurrentPaneDomain"
      } }
    },
    { key = "s",          mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    {
      key = "v",
      mods = "LEADER",
      action = wezterm.action { SplitHorizontal = {
        domain =
        "CurrentPaneDomain"
      } }
    },
    { key = "o",          mods = "LEADER",       action = "TogglePaneZoomState" },
    { key = "z",          mods = "LEADER",       action = "TogglePaneZoomState" },
    { key = "c",          mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    { key = "h",          mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "j",          mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "k",          mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "l",          mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "LeftArrow",  mods = "LEADER",       action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
    { key = "DownArrow",  mods = "LEADER",       action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
    { key = "UpArrow",    mods = "LEADER",       action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
    { key = "RightArrow", mods = "LEADER",       action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
    { key = "1",          mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
    { key = "2",          mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
    { key = "3",          mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
    { key = "4",          mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
    { key = "5",          mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
    { key = "6",          mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
    { key = "7",          mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
    { key = "8",          mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
    { key = "9",          mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },
    { key = "&",          mods = "LEADER|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
    { key = "d",          mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
    { key = "x",          mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
  }
}
