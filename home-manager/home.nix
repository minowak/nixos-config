{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./hyprland
    ./zsh
    ./walker

    inputs.walker.homeManagerModules.default
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  home.username = "minowak";
  home.homeDirectory = "/home/minowak";

  home.packages = with pkgs; [
    lsd
    yazi
  ];

  home.file.".avatar.jpg" = {
    source = ./avatar.jpg;
  };

  gtk.enable = true;
  qt.enable = true;

  programs.git = {
    enable = true;
    userName = "Michal Nowak";
    userEmail = "minowak@protonmail.ch";
  };

  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      search.placeholder = "Example";
      ui.fullscreen = true;
      list = {
        height = 200;
      };
      websearch.prefix = "?";
      switcher.prefix = "/";
    };
  };

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

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = 18.0;
      window_padding_width = 10;
      background_opacity = 0.9;
      editor = ".";
      foreground = "#a9b1d6";
      background = "#1a1b26";
      color0 = "#414868";
      color8 = "#414868";
      color1 = "#f7768e";
      color9 = "#f7768e";
      color2 = "#9ece6a";
      color10 ="#9ece6a";
      color3 = "#e0af68";
      color11 = "#e0af68";
      color4 = "#7aa2f7";
      color12 ="#7aa2f7";
      color5 = "#bb9af7";
      color13 = "#bb9af7";
      color6 = "#7dcfff";
      color14 = "#7dcfff";
      color7 = "#c0caf5";
      color15 = "#c0caf5";
      cursor = "#c0caf5";
      selection_foreground = "none";
      selection_background = "#28344a";
      url_color = "#b9f27c";
      active_border_color = "#3d59a1";
      inactive_border_color = "#101014";
      bell_border_color = "#e0af68";
      tab_bar_style = "fade";
      tab_fade = 1;
      active_tab_foreground = "#3d59a1";
      active_tab_font_style = "bold";
      inactive_tab_foreground = "#787c99";
      inactive_tab_font_style = "bold";
      tab_bar_background = "#101014";
      cursor_text_color = "#24283b";
      active_tab_background = "#1f2335";
      inactive_tab_background = "#1f2335";
      macos_titlebar_color = "#1f2335";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
