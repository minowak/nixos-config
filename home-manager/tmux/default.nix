{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    keyMode = "vi";
    baseIndex = 1;
    customPaneNavigationAndResize = true;

    plugins = with pkgs; [
      tmuxPlugins.power-theme
      tmuxPlugins.prefix-highlight
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.sensible
      tmuxPlugins.logging
    ];

    extraConfig =
      ''
        set -g mouse on
        bind-key Enter popup
        bind | split-window -h
        bind - split-window -v

        set -g @tmux_power_show_user false
        set -g @tmux_power_show_host false
        set -g @tmux_power_theme "colour12"

        set -g @tmux_power_prefix_highlight_pos 'LR'

        set -gq allow-passthrough on
        set -g status-position top
      '';
  };
}
