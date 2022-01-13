-- wezterm.lua

local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  -- local title = tab.active_pane.title
  local title = tab.active_pane.user_vars.branch or "<none>"
  local icon = ""
  local left = " "
  local right = " "
  if (tab.is_active) then
    left = "▎"
  end
  return {
    {Text=left.." "..icon.." "..title.." "..right},
  }
end)

wezterm.on("update-right-status", function(window, pane)
  -- Get user vars for the development environment
  local vars = pane:get_user_vars()
  local logname = (string.len(vars.logname or "") ~= 0 and vars.logname) or "<none>"
  local dbcontainer = (string.len(vars.dbcontainer or "") ~= 0 and vars.dbcontainer) or "<none>"
  local mudebug = (string.len(vars.mudebug or "") ~= 0 and vars.mudebug) or "0"
  local fglsqldebug = (string.len(vars.fglsqldebug or "") ~= 0 and vars.fglsqldebug) or "0"

  window:set_right_status(wezterm.format({
   {Foreground={Color="#69676c"}},
   {Background={Color="#191919"}},
   {Text="   "..logname.."   "..dbcontainer.."   "..mudebug..":"..fglsqldebug.."  "},
  }));
end)
--]]

-- Return config table
return {

  -- Options
  -----------------------------------------------------------------------------

  -- Spawn a git-bash shell in login mode
  -- default_prog = {"C:\\Program Files\\Git\\usr\\bin\\base.exe", "-i", "-l"},

  -- Initial window width/height of newly created windows
  initial_cols = 120,
  initial_rows = 28,

  default_cursor_style = "BlinkingBlock",
  scrollback_lines = 3500,
  scroll_to_bottom_on_input = true,
  pane_focus_follows_mouse = false,
  use_dead_keys = false,

  -- Disable titlebar
  -- window_decorations = "NONE",

  -- Set to "AlwaysPrompt" or "NeverPrompt"
  window_close_confirmation = "NeverPrompt",

  -- Show tab bar at the top when there's more than one tab
  enable_tab_bar = true,
  tab_bar_at_bottom = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_max_width = 50,

  -- Set to false to disable the scrollbar completely
  -- If right padding is set to 0 then it'll be increased to a single cell width
  enable_scroll_bar = false,

  check_for_updates = false,
  show_update_window = false,
  
  -- Bindings
  -----------------------------------------------------------------------------

  disable_default_key_bindings = false,

  keys = {
    {key="F11", mods="", action="ToggleFullScreen"},
    {key="n", mods="CTRL|SHIFT", action="ShowLauncher"},
  },

  disable_default_mouse_bindings = false,

  mouse_bindings = {
    -- Change the default click behavior so that it only selects text and
    -- doesn't open hyperlinks
    {
      event={Up={streak=1, button="Left"}},
      mods="NONE",
      action=wezterm.action{CompleteSelection="PrimarySelection"},
    },
    -- and make CTRL-Click open hyperlinks
    {
      event={Up={streak=1, button="Left"}},
      mods="CTRL",
      action="OpenLinkAtMouseCursor",
    },
  },

  -- Domains & launcher
  -----------------------------------------------------------------------------
  
  ssh_domains = {
    {
      name = "tbuck.net",
      remote_address = "tbuck.net",
      username = "tbck",
    },
    {
      name = "prdlin1",
      remote_address = "fdvmprdlin1",
      username = "tyler.buck",
    },
  },

  launch_menu = {
    {
      label = "INT_DEV",
      domain = {DomainName="local"},
      cwd = "/home/tbuck",
      args = {"/bin/bash", "-l", "-i"},
      set_environment_variables = {
        INITIAL_BRANCH = "INT_DEV",
      },
    },
    {
      label = "NXT_DEV",
      domain = {DomainName="local"},
      cwd = "/home/tbuck",
      args = {"/bin/bash", "-l", "-i"},
      set_environment_variables = {
        INITIAL_BRANCH = "NXT_DEV",
      },
    },
    {
      label = "2021.1",
      domain = {DomainName="local"},
      cwd = "/home/tbuck",
      args = {"/bin/bash", "-l", "-i"},
      set_environment_variables = {
        INITIAL_BRANCH = "2021.1",
      },
    },
    {
      label = "2020.1",
      domain = {DomainName="local"},
      cwd = "/home/tbuck",
      args = {"/bin/bash", "-l", "-i"},
      set_environment_variables = {
        INITIAL_BRANCH = "2020.1",
      },
    },
  },
  
  -- Theme
  -----------------------------------------------------------------------------

  font_size = 11.0,
  line_height = 1.0,

  font = wezterm.font_with_fallback({
    {family="JetBrains Mono"},
    {family="JetBrainsMono Nerd Font"},
  }),

  freetype_load_target = "Normal",

  window_padding = {
    left = 6,
    -- This will become the scrollbar width if the scrollbar is enabled
    right = 6,
    top = 6,
    bottom = 6,
  },

  -- Inactive panes are dimmed and de-saturated slightly by default
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },

  color_scheme = "Monokai Pro - Spectrum Filter",

  colors = {
    tab_bar = {
      background = "#131313",
      active_tab = {
        fg_color = "#5ad4e6",
        bg_color = "#1d1d1d",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        fg_color = "#69676c",
        bg_color = "#191919",
      },
      inactive_tab_hover = {
        fg_color = "#69676c",
        bg_color = "#191919",
      },
      new_tab = {
        fg_color = "#525053",
        bg_color = "#131313",
      },
      new_tab_hover = {
        fg_color = "#525053",
        bg_color = "#131313",
      },
    },
  },

  color_schemes = {
    ["Monokai Pro - Spectrum Filter"] = {
      foreground = "#f7f1ff",
      background = "#222222",
      cursor_fg ="#131313",
      cursor_bg = "#bab6c0",
      cursor_border = "#bab6c0",
      selection_fg ="#f7f1ff",
      selection_bg = "#828083",
      scrollbar_thumb ="#69676c",
      split = "#191919",
      ansi = {
        "#363537", -- 0
        "#fc618d", -- 1
        "#7bd88f", -- 2
        "#fce566", -- 3
        "#fd9353", -- 4
        "#948ae3", -- 5
        "#5ad4e6", -- 6
        "#bab6c0", -- 7
      },
      brights = {
        "#69676c", -- 8
        "#fc618d", -- 9
        "#7bd88f", -- 10
        "#fce566", -- 11
        "#fd9353", -- 12
        "#948ae3", -- 13
        "#5ad4e6", -- 14
        "#f7f1ff", -- 15
      },
      -- Errors in debug logs... 'indexed' not valid. 
      -- Not using latest wezterm version?
      -- indexed = {
      --   [16] = "#131313",
      --   [17] = "#191919",
      --   [18] = "#1d1d1d",
      --   [19] = "#222222",
      --   [20] = "#2d2c2d",
      --   [21] = "#4b494c",
      --   [22] = "#525053",
      --   [23] = "#8b888f",
      -- },
    },
  },
  
}

