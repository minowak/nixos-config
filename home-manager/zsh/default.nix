{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    oh-my-zsh
    zsh-fzf-history-search
  ];

  programs.starship.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      ls = "lsd";
    };
    
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git"
      ];
      theme = "robbyrussell";
    };

    initExtra = ''
      source ${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh

      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

      eval "$(starship init zsh)"
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
