{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    keyMode = "vi";
    baseIndex = 1;
    customPaneNavigationAndResize = true;

    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.sensible
      tmuxPlugins.logging
      tmuxPlugins.weather
      tmuxPlugins.tokyo-night-tmux
    ];

    extraConfig =
      ''
        set -g mouse on
        bind-key Enter popup
        bind | split-window -h
        bind - split-window -v

        set -gq allow-passthrough on
        set -g status-position top

        set -g @tokyo-night-tmux_theme storm
        set @tokyo-night-tmux_pane_id_style dsquare
      '';
  };
}
