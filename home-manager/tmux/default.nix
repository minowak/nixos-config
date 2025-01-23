{ pkgs, ... }:

let
  tmux-menus = pkgs.tmuxPlugins.mkTmuxPlugin
  {
      pluginName="menus";
      version = "76d2b6d";
      rtpFilePath = "menus.tmux";
      src = pkgs.fetchFromGitHub {
        owner = "jaclu";
        repo = "tmux-menus";
        rev = "76d2b6d76a54d4feef298e8fcfbeb81262d572c3";
        sha256 = "sha256-fGYJGJLJc2WIMrT2VRrUG/UkpUj/U9AqphEOdYspmlg=";
      };
  };
  tmux-power = pkgs.tmuxPlugins.mkTmuxPlugin
  {
      pluginName="power";
      version = "e68f9e6";
      rtpFilePath = "tmux-power.tmux";
      src = pkgs.fetchFromGitHub {
        owner = "wfxr";
        repo = "tmux-power";
        rev = "e68f9e6fb42cf372c2f17b51edc63abb4f6e9558";
        sha256 = "sha256-A+GYM+QegeivfwThfZ0vlAt/Lo4dOjnYomucEZNExlM=";
      };
  };
in 
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
      tmuxPlugins.prefix-highlight
      tmux-menus
      tmux-power
    ];

    extraConfig =
      ''
        set -g mouse on
        bind-key Enter popup
        bind | split-window -h
        bind - split-window -v

        set -g @tmux_power_show_user false
        set -g @tmux_power_show_host false
        set -g @tmux_power_theme "colour2"

        set -g @tmux_power_prefix_highlight_pos 'L'

        set -gq allow-passthrough on
        set -g status-position top

        run-shell ${pkgs.tmuxPlugins.prefix-highlight}/share/tmux-plugins/prefix-highlight/prefix_highlight.tmux
        run-shell ${tmux-menus}/share/tmux-plugins/menus/menus.tmux
        run-shell ${tmux-power}/share/tmux-plugins/power/tmux-power.tmux
      '';
  };
}
