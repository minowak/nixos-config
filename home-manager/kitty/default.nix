{ callPackage, config, pkgs, ... }:

{
  home.file.".config/kitty/kitty.conf" = {
    source = ../../dotfiles/kitty/.config/kitty/kitty.conf;
  };
}
