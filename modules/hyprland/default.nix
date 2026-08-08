{ lib, config, pkgs, ... }:

{
  # Wallpapers
  home.file."Pictures/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  services.wpaperd = {
    enable = true;
    settings = {
      any = {
        duration = lib.mkForce "30m";
        sorting = lib.mkForce "random";
        path = lib.mkForce "${config.home.homeDirectory}/Pictures/wallpapers";
        mode = lib.mkForce "center";
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    # Hyprland 0.55+ uses Lua.
    configType = "lua";

    xwayland.enable = true;

    extraConfig = ''
      ----------------------------------------------------------------------
      -- Variables
      ----------------------------------------------------------------------

      local mod = "SUPER"
      local terminal = "kitty"
      local fileManager = "nautilus"
      local menu = "wofi --show drun --allow-images"


      ----------------------------------------------------------------------
      -- Monitor
      ----------------------------------------------------------------------

      hl.monitor({
        output = "DP-1",
        mode = "preferred",
        position = "auto",
        scale = 1,
      })


      ----------------------------------------------------------------------
      -- General
      ----------------------------------------------------------------------

      hl.config({
        general = {
          gaps_in = 10,
          gaps_out = 20,
          border_size = 3,
          allow_tearing = false,
          layout = "dwindle",
        },

        decoration = {
          rounding = 15,
          active_opacity = 1.0,
          inactive_opacity = 1.0,

          shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
          },

          blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
          },
        },

        animations = {
          enabled = true,
        },

        dwindle = {
          preserve_split = true,
        },

        master = {
          new_status = "master",
        },

        misc = {
          force_default_wallpaper = -1,
        },

        input = {
          kb_layout = "us",
          kb_variant = "",
          kb_model = "",
          kb_options = "",
          kb_rules = "",
          follow_mouse = 1,
          sensitivity = 0,

          touchpad = {
            natural_scroll = false,
          },
        },
      })


      ----------------------------------------------------------------------
      -- Animation curves
      ----------------------------------------------------------------------

      hl.curve("easeOutQuint", {
        type = "bezier",
        points = {
          { 0.23, 1.0 },
          { 0.32, 1.0 },
        },
      })

      hl.curve("easeInOutCubic", {
        type = "bezier",
        points = {
          { 0.65, 0.05 },
          { 0.36, 1.0 },
        },
      })

      hl.curve("linear", {
        type = "bezier",
        points = {
          { 0.0, 0.0 },
          { 1.0, 1.0 },
        },
      })

      hl.curve("almostLinear", {
        type = "bezier",
        points = {
          { 0.5, 0.5 },
          { 0.75, 1.0 },
        },
      })

      hl.curve("quick", {
        type = "bezier",
        points = {
          { 0.15, 0.0 },
          { 0.1, 1.0 },
        },
      })


      ----------------------------------------------------------------------
      -- Animations
      ----------------------------------------------------------------------

      hl.animation({
        leaf = "global",
        enabled = true,
        speed = 10,
        bezier = "default",
      })

      hl.animation({
        leaf = "border",
        enabled = true,
        speed = 5.39,
        bezier = "easeOutQuint",
      })

      hl.animation({
        leaf = "windows",
        enabled = true,
        speed = 4.79,
        bezier = "easeOutQuint",
      })

      hl.animation({
        leaf = "windowsIn",
        enabled = true,
        speed = 4.1,
        bezier = "easeOutQuint",
        style = "popin 87%",
      })

      hl.animation({
        leaf = "windowsOut",
        enabled = true,
        speed = 1.49,
        bezier = "linear",
        style = "popin 87%",
      })

      hl.animation({
        leaf = "fadeIn",
        enabled = true,
        speed = 1.73,
        bezier = "almostLinear",
      })

      hl.animation({
        leaf = "fadeOut",
        enabled = true,
        speed = 1.46,
        bezier = "almostLinear",
      })

      hl.animation({
        leaf = "fade",
        enabled = true,
        speed = 3.03,
        bezier = "quick",
      })

      hl.animation({
        leaf = "layers",
        enabled = true,
        speed = 3.81,
        bezier = "easeOutQuint",
      })

      hl.animation({
        leaf = "layersIn",
        enabled = true,
        speed = 4,
        bezier = "easeOutQuint",
        style = "fade",
      })

      hl.animation({
        leaf = "layersOut",
        enabled = true,
        speed = 1.5,
        bezier = "linear",
        style = "fade",
      })

      hl.animation({
        leaf = "fadeLayersIn",
        enabled = true,
        speed = 1.79,
        bezier = "almostLinear",
      })

      hl.animation({
        leaf = "fadeLayersOut",
        enabled = true,
        speed = 1.39,
        bezier = "almostLinear",
      })

      hl.animation({
        leaf = "workspaces",
        enabled = true,
        speed = 1.94,
        bezier = "almostLinear",
        style = "fade",
      })

      hl.animation({
        leaf = "workspacesIn",
        enabled = true,
        speed = 1.21,
        bezier = "almostLinear",
        style = "fade",
      })

      hl.animation({
        leaf = "workspacesOut",
        enabled = true,
        speed = 1.94,
        bezier = "almostLinear",
        style = "fade",
      })


      ----------------------------------------------------------------------
      -- Input device
      ----------------------------------------------------------------------

      hl.device({
        name = "epic-mouse-v1",
        sensitivity = -0.5,
      })


      ----------------------------------------------------------------------
      -- Workspaces
      ----------------------------------------------------------------------

      hl.workspace_rule({
        workspace = "1",
        monitor = "DP-1",
      })

      hl.workspace_rule({
        workspace = "2",
        monitor = "DP-1",
      })

      hl.workspace_rule({
        workspace = "3",
        monitor = "DP-1",
      })

      hl.workspace_rule({
        workspace = "4",
        monitor = "DP-1",
      })

      hl.workspace_rule({
        workspace = "5",
        monitor = "DP-1",
      })


      ----------------------------------------------------------------------
      -- Window rules
      ----------------------------------------------------------------------

      -- Suppress maximize events for all windows.
      hl.window_rule({
        match = {
          class = ".*",
        },
        suppress_event = "maximize",
      })

      -- Do not focus empty XWayland floating windows.
      hl.window_rule({
        match = {
          class = "^$",
          title = "^$",
          xwayland = true,
          float = true,
          fullscreen = false,
          pin = false,
        },
        no_focus = true,
      })

      -- CopyQ
      hl.window_rule({
        match = {
          class = "^(copyq)$",
        },
        float = true,
      })

      hl.window_rule({
        match = {
          class = "^(copyq)$",
        },
        size = { 622, 652 },
      })


      ----------------------------------------------------------------------
      -- Keybindings
      ----------------------------------------------------------------------

      -- Applications
      hl.bind(
        mod .. " + T",
        hl.dsp.exec_cmd(terminal)
      )

      hl.bind(
        mod .. " + Q",
        hl.dsp.window.close()
      )

      hl.bind(
        mod .. " + M",
        hl.dsp.exit()
      )

      hl.bind(
        mod .. " + E",
        hl.dsp.exec_cmd(fileManager)
      )

      hl.bind(
        mod .. " + F",
        hl.dsp.window.float()
      )

      -- Dwindle pseudo-tile
      hl.bind(
        mod .. " + P",
        hl.dsp.window.pseudo()
      )

      -- Dwindle split toggle
      hl.bind(
        mod .. " + J",
        hl.dsp.layout("togglesplit")
      )


      -- Workspace navigation
      hl.bind(
        "CTRL + LEFT",
        hl.dsp.focus({ workspace = "-1" })
      )

      hl.bind(
        "CTRL + RIGHT",
        hl.dsp.focus({ workspace = "+1" })
      )


      -- Focus movement
      hl.bind(
        mod .. " + LEFT",
        hl.dsp.focus({ direction = "l" })
      )

      hl.bind(
        mod .. " + RIGHT",
        hl.dsp.focus({ direction = "r" })
      )

      hl.bind(
        mod .. " + UP",
        hl.dsp.focus({ direction = "u" })
      )

      hl.bind(
        mod .. " + DOWN",
        hl.dsp.focus({ direction = "d" })
      )


      -- Workspaces 1-10
      hl.bind(mod .. " + 1", hl.dsp.focus({ workspace = 1 }))
      hl.bind(mod .. " + 2", hl.dsp.focus({ workspace = 2 }))
      hl.bind(mod .. " + 3", hl.dsp.focus({ workspace = 3 }))
      hl.bind(mod .. " + 4", hl.dsp.focus({ workspace = 4 }))
      hl.bind(mod .. " + 5", hl.dsp.focus({ workspace = 5 }))
      hl.bind(mod .. " + 6", hl.dsp.focus({ workspace = 6 }))
      hl.bind(mod .. " + 7", hl.dsp.focus({ workspace = 7 }))
      hl.bind(mod .. " + 8", hl.dsp.focus({ workspace = 8 }))
      hl.bind(mod .. " + 9", hl.dsp.focus({ workspace = 9 }))
      hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))


      -- Move windows to workspaces 1-10
      hl.bind(mod .. " + SHIFT + 1",
        hl.dsp.window.move({ workspace = 1 }))

      hl.bind(mod .. " + SHIFT + 2",
        hl.dsp.window.move({ workspace = 2 }))

      hl.bind(mod .. " + SHIFT + 3",
        hl.dsp.window.move({ workspace = 3 }))

      hl.bind(mod .. " + SHIFT + 4",
        hl.dsp.window.move({ workspace = 4 }))

      hl.bind(mod .. " + SHIFT + 5",
        hl.dsp.window.move({ workspace = 5 }))

      hl.bind(mod .. " + SHIFT + 6",
        hl.dsp.window.move({ workspace = 6 }))

      hl.bind(mod .. " + SHIFT + 7",
        hl.dsp.window.move({ workspace = 7 }))

      hl.bind(mod .. " + SHIFT + 8",
        hl.dsp.window.move({ workspace = 8 }))

      hl.bind(mod .. " + SHIFT + 9",
        hl.dsp.window.move({ workspace = 9 }))

      hl.bind(mod .. " + SHIFT + 0",
        hl.dsp.window.move({ workspace = 10 }))


      -- Application launcher
      hl.bind(
        mod .. " + SPACE",
        hl.dsp.exec_cmd(menu)
      )

      hl.bind(
        "ALT + SPACE",
        hl.dsp.exec_cmd(menu)
      )


      -- Next wallpaper
      hl.bind(
        mod .. " + W",
        hl.dsp.exec_cmd("wpaperctl next")
      )


      -- Mouse wheel workspace switching
      hl.bind(
        mod .. " + mouse_down",
        hl.dsp.focus({ workspace = "e+1" })
      )

      hl.bind(
        mod .. " + mouse_up",
        hl.dsp.focus({ workspace = "e-1" })
      )


      -- CopyQ
      hl.bind(
        mod .. " + V",
        hl.dsp.exec_cmd("copyq toggle")
      )


      ----------------------------------------------------------------------
      -- Mouse bindings
      ----------------------------------------------------------------------

      hl.bind(
        mod .. " + mouse:272",
        hl.dsp.window.drag(),
        { mouse = true }
      )

      hl.bind(
        mod .. " + mouse:273",
        hl.dsp.window.resize(),
        { mouse = true }
      )


      ----------------------------------------------------------------------
      -- Volume / brightness keys
      ----------------------------------------------------------------------

      hl.bind(
        "XF86AudioRaiseVolume",
        hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+")
      )

      hl.bind(
        "XF86AudioLowerVolume",
        hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-")
      )

      hl.bind(
        "XF86AudioMute",
        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
      )

      hl.bind(
        "XF86AudioMicMute",
        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
      )

      hl.bind(
        "XF86MonBrightnessUp",
        hl.dsp.exec_cmd("brightnessctl s 10%+")
      )

      hl.bind(
        "XF86MonBrightnessDown",
        hl.dsp.exec_cmd("brightnessctl s 10%-")
      )


      ----------------------------------------------------------------------
      -- Media keys
      ----------------------------------------------------------------------

      hl.bind(
        "XF86AudioNext",
        hl.dsp.exec_cmd("playerctl next")
      )

      hl.bind(
        "XF86AudioPause",
        hl.dsp.exec_cmd("playerctl play-pause")
      )

      hl.bind(
        "XF86AudioPlay",
        hl.dsp.exec_cmd("playerctl play-pause")
      )

      hl.bind(
        "XF86AudioPrev",
        hl.dsp.exec_cmd("playerctl previous")
      )


      ----------------------------------------------------------------------
      -- Startup
      ----------------------------------------------------------------------

      hl.on("hyprland.start", function()
        hl.exec_cmd("copyq --start-server")
        hl.exec_cmd("hyprpanel")
      end)
    '';
  };
}

