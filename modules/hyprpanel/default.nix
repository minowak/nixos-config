{ pkgs, ... }:

{
  programs.hyprpanel = {
    enable = true;
    overwrite.enable = true;
    theme = "tokyo_night";

    layout = {
      "bar.layouts" = {
        "*" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "media" ];
          right = [ "systray" "volume" "network" "clock" "notifications" ];
        };
      };
    };

    settings = {
      bar = {
        launcher.autoDetectIcon = true;
      };

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather = {
          unit = "metric";
          key = "9f50903f6d33401cbb2145130250501";
          location = "Krakow";
        };
      };

      menus.dashboard = {
        controls.enabled = false;
        stats.enable_gpu = true;
        powermenu.avatar.image = "/home/minowak/.avatar.jpg";
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
