{ callPackage, config, pkgs, ... }:

{
  home.file.".tmux.conf" = {
    source = ../../tmux/.tmux.conf;
  };
}
