{ lib, inputs, config, pkgs, ... }:

{
  imports = [
    ./zsh
    ./kitty
    ./hyprland
    ./hyprpanel
    ./wofi
    ./copyq
    ./tmux

    inputs.walker.homeManagerModules.default
    inputs.hyprpanel.homeManagerModules.hyprpanel
    inputs.wpaperd.homeManagerModules.default
  ];

  # Just in case - override stylix image
  services.hyprpaper.enable = lib.mkForce false; 
  stylix.targets.hyprpaper.enable = lib.mkForce false;

  home.username = "minowak";
  home.homeDirectory = "/home/minowak";

  home.packages = with pkgs; [
    lsd
    yazi
    whitesur-icon-theme
    gnome-tweaks
    nwg-look
    gnome-themes-extra
    copyq
    gtk-layer-shell
  ];

  home.file.".avatar.jpg" = {
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

  xdg.userDirs.enable = true;

  wayland.windowManager.hyprland.enable = true;

  gtk = {
    enable = true;

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
      "inode/directory" = "org.gnome.Nautilus.desktop";
      "inode/folder" = "org.gnome.Nautilus.desktop";
      "image/png" = "org.gnome.eog.desktop";
      "image/jpg" = "org.gnome.eog.desktop";
    };
  };

  programs.git = {
    enable = true;
    userName = "Michal Nowak";
    userEmail = "minowak@protonmail.ch";
    aliases = {
      co = "checkout";
      st = "status";
    };
    extraConfig = {
      credential.helper = "manager";
      credential."https://github.com".username = "minowak";
      credential.credentialStore = "cache";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
