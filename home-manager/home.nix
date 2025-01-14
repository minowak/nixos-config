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
  ];

  home.username = "minowak";
  home.homeDirectory = "/home/minowak";

  home.packages = with pkgs; [
    lsd
    yazi
    tokyonight-gtk-theme
    gnome-tweaks
    nwg-look
    gnome-themes-extra
  ];

  home.file.".avatar.jpg" = {
    source = ./avatar.jpg;
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
  };
  qt.enable = true;

  programs.git = {
    enable = true;
    userName = "Michal Nowak";
    userEmail = "minowak@protonmail.ch";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
