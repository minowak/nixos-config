{ pkgs, ... }:

{
  home.file.".config/walker/" = {
    source = ./config;
    recursive = true;
  };
  
  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      search.placeholder = "Example";
      ui.fullscreen = true;
      list = {
        height = 200;
      };
      websearch.prefix = "?";
      switcher.prefix = "/";
    };
  };
}
