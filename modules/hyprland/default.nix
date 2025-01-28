{ lib, pkgs, ... }:

{
  home.file."Pictures/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  programs.wpaperd = {
    enable = true;
    settings = {
      any = {
        duration = lib.mkForce "30m";
        sorting = lib.mkForce "random";
        path = lib.mkForce "/home/minowak/Pictures/wallpapers";
        mode = lib.mkForce "center";
      };
    };
  };

  wayland.windowManager.hyprland = { 
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = "DP-1,preferred,auto,1";
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      general = {
        gaps_in = 10;
        gaps_out = 20;
        border_size = 3;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 15;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
        };
        blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
        };
      };
      animations = {
          enabled = true;
          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];
          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
      dwindle = {
          pseudotile = true;
          preserve_split = true;
      };
      master = {
          new_status = "master";
      };
      misc = {
          force_default_wallpaper = -1;
          disable_hyprland_logo = false;
      };
      input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad = {
              natural_scroll = false;
          };
      };
      gestures = {
          workspace_swipe = false;
      };
      device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
      };
      workspace = [
        "1, monitor:DP-1"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
      ];
      bind = let
        fileManager = "nautilus";
        menu = "wofi --show drun --allow-images";
      in [
        ''$mod, Q, exec, $terminal''
        ''$mod, C, killactive,''
        ''$mod, M, exit,''
        ''$mod, E, exec, ${fileManager}''
        ''$mod, F, togglefloating,''
        ''$mod, P, pseudo, # dwindle''
        ''$mod, J, togglesplit, # dwindle''
        ''CTRL,LEFT,workspace,-1''
        ''CTRL,RIGHT,workspace,+1''
        ''$mod, left, movefocus, l''
        ''$mod, right, movefocus, r''
        ''$mod, up, movefocus, u''
        ''$mod, down, movefocus, d''
        ''$mod, 1, workspace, 1''
        ''$mod, 2, workspace, 2''
        ''$mod, 3, workspace, 3''
        ''$mod, 4, workspace, 4''
        ''$mod, 5, workspace, 5''
        ''$mod, 6, workspace, 6''
        ''$mod, 7, workspace, 7''
        ''$mod, 8, workspace, 8''
        ''$mod, 9, workspace, 9''
        ''$mod, 0, workspace, 10''
        ''$mod SHIFT, 1, movetoworkspace, 1''
        ''$mod SHIFT, 2, movetoworkspace, 2''
        ''$mod SHIFT, 3, movetoworkspace, 3''
        ''$mod SHIFT, 4, movetoworkspace, 4''
        ''$mod SHIFT, 5, movetoworkspace, 5''
        ''$mod SHIFT, 6, movetoworkspace, 6''
        ''$mod SHIFT, 7, movetoworkspace, 7''
        ''$mod SHIFT, 8, movetoworkspace, 8''
        ''$mod SHIFT, 9, movetoworkspace, 9''
        ''$mod SHIFT, 0, movetoworkspace, 10''
        ''$mod, SPACE, exec, ${menu}''
        ''$mod, W, exec, wpaperctl next''
        ''$mod, mouse_down, workspace, e+1''
        ''$mod, mouse_up, workspace, e-1''
        ''$mod, V, exec, copyq toggle''
      ];
      bindm = [
        ''$mod, mouse:272, movewindow''
        ''$mod, mouse:273, resizewindow''
      ];
      bindel = [
        '',XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+''
        '',XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-''
        '',XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle''
        '',XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle''
        '',XF86MonBrightnessUp, exec, brightnessctl s 10%+''
        '',XF86MonBrightnessDown, exec, brightnessctl s 10%-''
      ];
      bindl = [
        '', XF86AudioNext, exec, playerctl next''
        '', XF86AudioPause, exec, playerctl play-pause''
        '', XF86AudioPlay, exec, playerctl play-pause''
        '', XF86AudioPrev, exec, playerctl previous''
      ];
      windowrulev2 = [
        ''suppressevent maximize, class:.*''
        ''nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0''
        ''float, class:(copyq)''
        ''size 622 652, class:(copyq)''
      ];
      exec-once = [
        ''copyq --start-server''
        ''hyprpanel''
        ''wpaperd -d''
      ];
    };
  };
}
