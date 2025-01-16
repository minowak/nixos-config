{ pkgs, ... }:

{
  home.file.".config/walker/" = {
    source = ./config;
    recursive = true;
  };

  # FIXME on mouse hover
  # Gtk:ERROR:../gtk/gtkwindow.c:5024:check_crossing_invariants: assertion failed: (crossing->new_target
  
  programs.walker = {
    enable = true;
    runAsService = false;
    # Still using config.json, crashes without it but everything is being overwritten
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
