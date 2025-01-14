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
        set -g default-terminal "tmux-256color"
        set -ga terminal-overrides ",xterm-256color:RGB"

        set -g @theme_variation "storm"
        set -g @theme-plugins "yay",weather,datetime";
      '';
  };
}
