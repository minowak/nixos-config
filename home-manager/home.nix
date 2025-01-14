{ inputs, config, pkgs, ... }:

{
  imports = [
    ./zsh
    ./kitty
    ./hyprland
    ./hyprpanel
    ./walker
    ./tmux

    inputs.walker.homeManagerModules.default
    inputs.hyprpanel.homeManagerModules.hyprpanel
    inputs.wpaperd.homeManagerModules.default
  ];

  home.username = "minowak";
  home.homeDirectory = "/home/minowak";

  home.packages = with pkgs; [
    lsd
    yazi
    tokyonight-gtk-theme
    whitesur-icon-theme
    gnome-tweaks
    nwg-look
    gnome-themes-extra
    xdg-user-dirs
  ];

  home.file.".face.icon" = {
    source = ./avatar.jpg;
  };

  home.activation = {
    init = ''
      mkdir -p Downloads
      mkdir -p Documents
      mkdir -p Videos
      mkdir -p Music
      mkdir -p Projects
      '';
  };

  wayland.windowManager.hyprland.enable = true;

  gtk = {
    enable = true;

    font = {
      name = "JetBrainsMono";
      size = 13;
    };

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    iconTheme = {
      name ="WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "Tokyonight-Dark";
    style.package = pkgs.tokyonight-gtk-theme;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "thunar.desktop";
      "inode/folder" = "thunar.desktop";
    };
  };

  programs.git = {
    enable = true;
    userName = "Michal Nowak";
    userEmail = "minowak@protonmail.ch";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
