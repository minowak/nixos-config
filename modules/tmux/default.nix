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
      tmuxPlugins.catppuccin
    ];

    extraConfig =
      ''
        set -g mouse on
        bind-key Enter popup
        bind | split-window -h
        bind - split-window -v

        set -g @catppuccin_flavor "frappe"

        set -gq allow-passthrough on
        set -g status-position top

        set -g @menus_trigger m

        run-shell ${tmux-menus}/share/tmux-plugins/menus/menus.tmux
        run-shell ${pkgs.tmuxPlugins.prefix-highlight}/share/tmux-plugins/prefix-highlight/prefix_highlight.tmux
      '';
  };
}
