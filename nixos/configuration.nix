# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  stylix.enable = true;
  stylix.base16Scheme ="${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
  stylix.image = ./wallpaper.png;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    serif = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };

    sizes = {
      applications = 14;
      terminal = 14;
      desktop = 12;
      popups = 12;
    };
  };
  stylix.polarity = "dark";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  qt.enable = true;

  time.timeZone = "Europe/Warsaw";

  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
  };

  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      package = pkgs.kdePackages.sddm;
      enable = true;
      theme = "sddm-astronaut-theme";
      extraPackages = [ 
        pkgs.sddm-astronaut 
	      pkgs.kdePackages.qt5compat
      ];
    };
  };


  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = true;
    };
  };
    
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };


  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.minowak = {
    isNormalUser = true;
    initialPassword = "qwe321";
    useDefaultShell = true;
    extraGroups = ["networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.hyprland = { 
    enable = true;
    xwayland.enable = true;
  };

  programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Hint electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.shells = with pkgs; [ zsh ];

  environment.systemPackages = with pkgs; [
    brave
    btop
    fzf
    gcc
    gdk-pixbuf
    git
    gtk-engine-murrine
    kdePackages.qt5compat
    kitty
    lazygit
    neofetch
    neovim
    nodejs_22
    python311
    ripgrep
    sddm-astronaut
    stow
    tmux
    vim
    wget
    xfce.thunar
  ];

  system.stateVersion = "24.11";
}

