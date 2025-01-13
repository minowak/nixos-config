{ pkgs, ... }:

{
  home.file.".config/walker/" = {
    source = ../../dotfiles/walker/.config/walker;
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
