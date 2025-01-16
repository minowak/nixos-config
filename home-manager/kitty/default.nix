{ lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      font_size = 18.0;
      window_padding_width = 10;
      background_opacity = 0.9;
      editor = ".";
      selection_foreground = "none";
      tab_bar_style = "fade";
      tab_fade = 1;
      active_tab_font_style = "bold";
      inactive_tab_font_style = "bold";
    };
  };
}
