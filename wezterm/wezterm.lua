local wezterm = require('wezterm')
local act = wezterm.action

local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

config.color_scheme = 'Gruvbox Dark (Gogh)'

config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = false

config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font_with_fallback({
  { family = 'CaskaydiaCove Nerd Font', scale = 1.2, weight = 'Medium' },
})

config.default_cursor_style = 'SteadyBar'

config.disable_default_key_bindings = true

config.window_background_opacity = 0.9
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'AlwaysPrompt'
config.scrollback_lines = 3000
config.default_workspace = 'main'

config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5,
}

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = act.SendKey({ key = 'a', mods = 'CTRL' }),
  },
  { key = 'phys:Space', mods = 'LEADER', action = act.ActivateCommandPalette },

  {
    key = 's',
    mods = 'LEADER',
    action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },

  { key = 'h',          mods = 'LEADER', action = act.ActivatePaneDirection('Left') },
  { key = 'j',          mods = 'LEADER', action = act.ActivatePaneDirection('Down') },
  { key = 'k',          mods = 'LEADER', action = act.ActivatePaneDirection('Up') },
  { key = 'l',          mods = 'LEADER', action = act.ActivatePaneDirection('Right') },

  { key = 'q',          mods = 'LEADER', action = act.CloseCurrentPane({ confirm = true }) },
  { key = 'z',          mods = 'LEADER', action = act.TogglePaneZoomState },
  { key = 'o',          mods = 'LEADER', action = act.RotatePanes('Clockwise') },
  {
    key = 'r',
    mods = 'LEADER',
    action = act.ActivateKeyTable({ name = 'resize_pane', one_shot = false }),
  },

  { key = 't', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },
  { key = '[', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = ']', mods = 'LEADER', action = act.ActivateTabRelative(1) },
  { key = 'n', mods = 'LEADER', action = act.ShowTabNavigator },
  {
    key = 'e',
    mods = 'LEADER',
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Renaming Tab Title...:' },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        if line then window:active_tab():set_title(line) end
      end),
    }),
  },
  {
    key = 'm',
    mods = 'LEADER',
    action = act.ActivateKeyTable({ name = 'move_tab', one_shot = false }),
  },
  { key = '{', mods = 'LEADER|SHIFT', action = act.MoveTabRelative(-1) },
  { key = '}', mods = 'LEADER|SHIFT', action = act.MoveTabRelative(1) },

  {
    key = 'w',
    mods = 'LEADER',
    action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
  },
}

config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false

config.key_tables = {
  resize_pane = {
    { key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
    { key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
    { key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
    { key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'Enter',  action = 'PopKeyTable' },
  },
  move_tab = {
    { key = 'h',      action = act.MoveTabRelative(-1) },
    { key = 'j',      action = act.MoveTabRelative(-1) },
    { key = 'k',      action = act.MoveTabRelative(1) },
    { key = 'l',      action = act.MoveTabRelative(1) },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'Enter',  action = 'PopKeyTable' },
  },
}

wezterm.on('update-status', function(window, pane)
  local stat = window:active_workspace()
  local stat_color = '#f7768e'
  if window:active_key_table() then
    stat = window:active_key_table()
    stat_color = '#7dcfff'
  end
  if window:leader_is_active() then
    stat = 'LDR'
    stat_color = '#bb9af7'
  end

  local basename = function(s) return string.gsub(s, '(.*[/\\])(.*)', '%2') end

  local cwd = pane:get_current_working_dir()
  if cwd then
    if type(cwd) == 'userdata' then
      cwd = basename(cwd.file_path)
    else
      cwd = basename(cwd)
    end
  else
    cwd = ''
  end

  local cmd = pane:get_foreground_process_name()
  cmd = cmd and basename(cmd) or ''

  window:set_left_status(wezterm.format({
    { Foreground = { Color = stat_color } },
    { Text = '  ' },
    { Text = wezterm.nerdfonts.oct_table .. ' ' },
    { Text = ' |' },
  }))

  window:set_right_status(wezterm.format({
    { Text = wezterm.nerdfonts.md_folder .. '  ' .. cwd },
    { Text = ' | ' },
    { Foreground = { Color = '#e0af68' } },
    { Text = wezterm.nerdfonts.fa_code .. '  ' .. cmd },
    'ResetAttributes',
    { Text = '  ' },
  }))
end)

config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0cell',
}

return config
