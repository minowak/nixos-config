{ callPackage, config, pkgs, ... }:

{
  home.file.".config/kitty/kitty.conf" = {
    source = ./kitty.conf;
  };
}
