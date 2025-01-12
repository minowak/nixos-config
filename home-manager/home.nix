{ config, pkgs, ... }:

{
  imports = [
    ./hyprland
    ./kitty
    ./zsh
    ./walker
  ];

  home.username = "minowak";
  home.homeDirectory = "/home/minowak";

  home.packages = with pkgs; [
    lsd
    yazi
  ];

  programs.git = {
    enable = true;
    userName = "Michal Nowak";
    userEmail = "minowak@protonmail.ch";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
