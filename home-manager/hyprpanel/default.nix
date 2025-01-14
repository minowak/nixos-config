{ pkgs, ... }:

{
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    overwrite.enable = true;
    theme = "tokyo_night";

    layout = {
      "bar.layouts" = {
        "*" = {
          left = [ "dashboard" "workspaces" ];
          middle = [ "media" ];
          right = [ "systray" "volume" "network" "clock" "notifications" ];
        };
      };
    };

    settings = {
      bar = {
        launcher.autoDetectIcon = true;
        workspaces = {
          show_numbered = true;
          workspaces = 5;
        };
      };

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather = {
          unit = "metric";
          key = "03ac2c97dbf4dfe3f3166ac0fd238765";
          location = "Krakow";
        };
      };

      menus.dashboard = {
        controls.enabled = false;
        stats.enable_gpu = true;
        directories = {
          left.directory1.label = "󰉍  Downloads";
          left.directory2.label = "󰉏  Videos";
          left.directory3.label = "󰚝  Projects";
          right.directory1.label = "󱧶  Documents";
          right.directory2.label = "󰉏  Pictures";
          right.directory3.label = "󱂵  Home";
        };
        shortcuts = {
          left = {
            shortcut1 = {
              command = "brave";
              icon = "";
              tooltip = "Brave";
            };
            shortcut3 = {
              command = "nvim";
              icon = "";
              tooltip = "NeoVim";
            };
            shortcut4 = {
              command = "walker";
            };
          };
        };
      };

      theme.font = {
        name = "JetBrainsMono";
        size = "1rem";
      };
    };
  };
}
