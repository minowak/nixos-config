{ lib, config, pkgs, ...} :

{
  programs.rofi = {
    enable = true;
    theme = 
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          bg = mkLiteral "#24283b";
          border = mkLiteral "0px";
          black = mkLiteral "#101014";
          transparent = mkLiteral "rgba(46,52,64,0)";
          separatorcolor = lib.mkForce (mkLiteral "#2AC3DE");
          border-color = lib.mkForce (mkLiteral "#2AC3DE");
          alternate-normal-background = lib.mkForce (mkLiteral "@bg");
          selected-active-background = lib.mkForce (mkLiteral "#${config.lib.stylix.colors.base0E}");
          selected-normal-background = lib.mkForce (mkLiteral "#${config.lib.stylix.colors.base0E}");
        };
        "window" = {
          width = mkLiteral "700";
          orientation = mkLiteral "horizontal";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          transparency = "screenshot";
          border = mkLiteral "0px";
          border-radius = mkLiteral "6px";
          spacing = mkLiteral "0";
          children = mkLiteral "[ mainbox ]";
        };

        "mainbox" = {
          spacing = mkLiteral "0";
          children = mkLiteral "[ inputbar, message, listview ]";
        };
        "inputbar" = {
          padding = mkLiteral "11px";
          border = mkLiteral "3px 3px 2px 3px";
          border-radius = mkLiteral "12px 12px 0px 0px";
          children = mkLiteral "[ entry ]";
        };
        "message" = {
          padding = mkLiteral "0";
          border = mkLiteral "0px 1px 1px 1px";
        };
        "entry, prompt, case-indicator" = {
          text-font = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "entry" = {
          cursor = mkLiteral "pointer";
          vertical-align = mkLiteral "0.5";
        };
        "prompt" = {
          margin = mkLiteral "0px 5px 0px 0px";
        };
        "listview" = {
          layout = mkLiteral "vertical";
          padding = mkLiteral "8px";
          lines = mkLiteral "12";
          columns = mkLiteral "1";
          border = mkLiteral "0px 3px 3px 3px";
          border-radius = mkLiteral "0px 0px 12px 12px";
          dynamic = mkLiteral "false";
        };
        "element" = {
          padding = mkLiteral "8px";
          vertical-align = mkLiteral "0.5";
          font = mkLiteral "inherit";
        };
        "element-text" = {
          text-color = mkLiteral "inherit";
        };
        "element selected.active" = {
        };
        "element selected.normal" = {
          color = mkLiteral "@black";
        };
        "element normal active" = {
          color = mkLiteral "@black";
        };
        "element-icon" = {
          size = mkLiteral "1em";
          padding = mkLiteral "0 10px 0 0";
        };
        "element-text, element-icon" = {
          text-color = mkLiteral "inherit";
        };
        "element selected active" = {
          foreground = mkLiteral "@bg";
        };
        "button" = {
          padding = mkLiteral "6px";
          color = mkLiteral "@primary";
          horizonatal-align = mkLiteral "0.5";
          border = mkLiteral "2px 0px 2px 2px";
          border-radius = mkLiteral "4px 0px 0px 4px";
        };
        "button selected normal" = {
          border = mkLiteral "2px 0px 2px 2px";
        };
        "scrollbar" = {
          enabled = mkLiteral "true";
        };
      };
  };
}
