{ callPackage, config, pkgs, ... }:

{
  home.file.".config/walker/" = {
    source = ../../dotfiles/walker/.config/walker;
    recursive = true;
  };
}
