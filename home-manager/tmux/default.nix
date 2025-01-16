{ pkgs, ... }:
let
  tmux-tokyo-night = pkgs.tmuxPlugins.mkTmuxPlugin
  {
      pluginName = "tmux-tokyo-night";
      version = "5ce3730";
      rtpFilePath = "tmux-tokyo-night.tmux";
      src = pkgs.fetchFromGitHub {
        owner = "fabioluciano";
        repo = "tmux-tokyo-night";
        rev = "5ce373040f893c3a0d1cb93dc1e8b2a25c94d3da";
        sha256 = "sha256-9nDgiJptXIP+Hn9UY+QFMgoghw4HfTJ5TZq0f9KVOFg=";
      };
  };
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
      tmux-tokyo-night
      tmux-menus
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

        set -g @theme_variation "storm"
        set -g @menus_trigger \\

        set -gq allow-passthrough on
        set -g status-position top
      '';
  };
}
