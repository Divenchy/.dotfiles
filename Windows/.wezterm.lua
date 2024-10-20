local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window {}
  -- window:gui_window():maximize()
end)

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings

config.pane_focus_follows_mouse = true

-- Colorscheme
config.color_scheme = "tokyonight_storm"
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  { family = "Symbols Nerd Font Mono", scale = 1.2 },
})

-- Window and sizing
config.font_size = 15
config.native_macos_fullscreen_mode = true
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"
config.colors = {
  tab_bar = {
    background = "rgba(  46, 56, 60 0)",
  }
}

-- Setup Domains (Windows)
config.wsl_domains = {
  {
    -- The name of this specific domain.  Must be unique amonst all types
    -- of domain in the configuration file.
    name = 'WSL:openSUSE-Tumbleweed',

    -- The name of the distribution.  This identifies the WSL distribution.
    -- It must match a valid distribution from your `wsl -l -v` output in
    -- order for the domain to be useful.
    distribution = 'openSUSE-Tumbleweed',
    default_cwd = "/home/weoweowsl/"
  },
}


-- config.default_domain = "WSL:openSUSE-Tumbleweed"
config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- Tab bar styling


config.show_new_tab_button_in_tab_bar = false

-- The filled in variant of the < symbol
-- The filled in variant of the > symbol

-- First style (< tab name >)
-- local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
-- local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- Second style for tab shape ( < tab name ) )
-- local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
-- local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

-- Third style for tab ( ( tab name ) )
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = 'rgba(  46, 56, 60 0.2)'
    local background = 'rgba(  46, 56, 60 0.8)'
    local foreground = 'rgba(  109, 214, 156 0.5)'

    if tab.is_active then
      background = 'rgba( 109, 214, 156 1)'
      foreground = 'rgba( 46, 56, 60 0.5)'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground} },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background} },
      { Foreground = { Color = foreground} },
      { Text = title },
      { Background = { Color = edge_background} },
      { Foreground = { Color = edge_foreground} },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)
-- background = "rgba(  46, 56, 60 0.82)",
config.enable_tab_bar = true
-- Tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = true

-- Toggle opacity
wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.4
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

wezterm.on("update-status", function(window, pane)
  -- Workspace name
  local stat = window:active_workspace()
  local stat_color = "#f7768e"
  -- It's a little silly to have workspace name all the time
  -- Utilize this to display LDR or current key table name
  if window:active_key_table() then
    stat = window:active_key_table()
    stat_color = "#7dcfff"
  end
  if window:leader_is_active() then
    stat = "LDR"
    stat_color = "#bb9af7"
  end

  -- Current working directory
  local basename = function(s)
    -- Nothing a little regex can't fix
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
  -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l). Not a big deal, but check in case
  local cwd = pane:get_current_working_dir()
  cwd = cwd and basename(cwd) or ""
  -- Current command
  local cmd = pane:get_foreground_process_name()
  cmd = cmd and basename(cmd) or ""

  -- Time
  local time = wezterm.strftime("%H:%M")

  -- Left status (left of the tab line)
  window:set_left_status(wezterm.format({
    { Foreground = { Color = stat_color } },
    { Text = "  " },
    { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
    { Text = " |" },
  }))

  -- Right status
  window:set_right_status(wezterm.format({
    -- Wezterm has a built-in nerd fonts
    -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
    { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
    { Text = " | " },
    { Foreground = { Color = "#e0af68" } },
    { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
    "ResetAttributes",
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_clock .. "  " .. time.now:format_utc() },
    { Text = "  " },
  }))
end)

config.window_padding = {
  left = '0.6cell',
  right = '0cell',
  top = '0.3cell',
  bottom = '0cell',

}

-- Panes

-- Swap focus might be lit af

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'LeftAlt', mods = 'SUPER', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '\\',
    mods = 'SUPER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'SUPER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Font inc/dec
  { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
  { key = '=', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment},
  { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },

  --Rotate panes clockwise
  { key = 'r', mods = 'SUPER', action = act.RotatePanes 'Clockwise' },

  -- Activate pane selection
  {key="n", mods="SUPER", action=wezterm.action{ActivatePaneDirection="Next"}},
  {key="p", mods="SUPER", action=wezterm.action{ActivatePaneDirection="Prev"}},

  -- Tab through tabs
  { key = 'UpArrow', mods = 'SHIFT', action = act.ActivateTabRelative(-1) },
  { key = 'DownArrow', mods = 'SHIFT', action = act.ActivateTabRelative(1) },

  -- Spawn new window
  { key = 'n', mods = 'SHIFT|SUPER', action = wezterm.action.SpawnWindow },

  -- Fullscreen
  {
    key = 'f',
    mods = 'SUPER',
    action = wezterm.action.ToggleFullScreen,
  },

  -- Prompt to choose the shell when opening a new tab
  {
    key = 't',
    mods = 'CTRL',
    action = wezterm.action.SpawnCommandInNewTab {
      args = { 'pwsh.exe' },
      -- this is normally the default, but I'd recommend making it explicit
      -- when working on windows with WSL and other mux domains.
      -- This ensures that the command will be run on the wezterm GUI host
      -- and not in some other domain
      domain = { DomainName = 'local' }, 
    },
  },
  {
    key = 'o',
    mods = 'ALT',
    action = wezterm.action.EmitEvent 'toggle-opacity',
  },
}


return config
