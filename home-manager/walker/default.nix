{ callPackage, config, pkgs, ... }:

{
  home.file.".config/walker/themes" = {
    source = ../../dotfiles/walker/.config/walker;
    recursive = true;
  };
}
