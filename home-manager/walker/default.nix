{ pkgs, ... }:

{
  home.file.".config/walker/" = {
    source = ./config;
    recursive = true;
  };
  
  programs.walker = {
    enable = true;
    runAsService = true;
  };
}
