{ pkgs, ... }:

{
  home.file.".config/nwg-dock-hyprland/style.css" = {
   source = ./style.css; 
  };
}
