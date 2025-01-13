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
      bar.launcher.autoDetectIcon = true;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather = {
          unit = "metric";
          key = "03ac2c97dbf4dfe3f3166ac0fd238765";
        };
      };

      menus.dashboard = {
        controls.enabled = false;
        stats.enable_gpu = true;
        powermenu.avatar.image = "$HOME/.avatar.jpg";
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
        name ="JetBrainsMono";
      };
    };
  };
}
