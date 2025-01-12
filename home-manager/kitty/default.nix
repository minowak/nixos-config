{ callPackage, config, pkgs, ... }:

{
  home.file.".config/kitty/kitty.conf" = {
    source = ../../dotfiles/.config/kitty/kitty.conf;
  };
}
