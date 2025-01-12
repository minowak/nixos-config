{ config, pkgs, ... }:

{
  imports = [
    ./hyprland
    ./kitty
    ./zsh
    ./walker

    inputs.walker.homeManagerModules.default;
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

  programs.walker = {
    enable = true;
    runAsService = true;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
