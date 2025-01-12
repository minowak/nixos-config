{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    oh-my-zsh
    zsh-powerlevel10k
    zsh-fzf-history-search
  ];

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
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
