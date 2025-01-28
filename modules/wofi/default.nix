{ lib, pkgs, ...}:

{
  programs.wofi = {
    enable = true;
    settings = {
      no_actions = true;
      prompt = "Search...";
    };
    style = lib.mkForce ''
      @define-color rosewater #f7768e;
      @define-color rosewater-rgb rgb(247, 118, 142);
      @define-color flamingo #ff9e64;
      @define-color flamingo-rgb rgb(255, 158, 100);
      @define-color yellow #e0af68;
      @define-color yellow-rgb rgb(224, 175, 104);
      @define-color mauve #9ece6a;
      @define-color mauve-rgb rgb(158, 206, 106);
      @define-color red #1abc9c;
      @define-color red-rgb rgb(26, 188, 156);
      @define-color lavender #41a6b5;
      @define-color lavender rgb(65, 166, 181);
      @define-color peach #bb9af7;
      @define-color peach-rgb rgb(187, 154, 247);
      @define-color pink #ff007c;
      @define-color pink rgb(255, 0, 124);
      @define-color green #24283b;
      @define-color green-rgb rgb(36, 40, 59);
      @define-color teal #1f2335;
      @define-color teal-rgb rgb(31, 35, 53);
      @define-color sky #292e42;
      @define-color sky-rgb rgb(41, 46, 66);
      @define-color sapphire #565f89;
      @define-color sapphire-rgb rgb(86, 95, 137);
      @define-color blue #a9b1d6;
      @define-color blue-rgb rgb(169, 177, 214);
      @define-color maroon #c0caf5;
      @define-color maroon rgb(192, 202, 245);
      @define-color text #c0caf5;
      @define-color text-rgb rgb(192, 202, 245);
      @define-color subtext1 #c0caf5;
      @define-color subtext1-rgb rgb(192, 202, 245);
      @define-color subtext0 #a9b1d6;
      @define-color subtext0-rgb rgb(169, 177, 214);
      @define-color overlay2 #565f89;
      @define-color overlay2-rgb rgb(86, 95, 137);
      @define-color overlay1 #41a6b5;
      @define-color overlay1-rgb rgb(65, 166, 181);
      @define-color overlay0 #24283b;
      @define-color overlay0-rgb rgb(36, 40, 59);
      @define-color surface2 #1f2335;
      @define-color surface2-rgb rgb(31, 35, 53);
      @define-color surface1 #292e42;
      @define-color surface1-rgb rgb(41, 46, 66);
      @define-color surface0 #24283b;
      @define-color surface0-rgb rgb(36, 40, 59);
      @define-color base #24283b;
      @define-color base-rgb rgb(36, 40, 59);
      @define-color mantle #1f2335;
      @define-color mantle-rgb rgb(31, 35, 53);
      @define-color crust #11111b;
      @define-color crust-rgb rgb(17, 17, 27);

      * {
        font-family: 'CaskaydiaCove Nerd Font', monospace;
        font-size: 18px;
      }

      /* Window */
      window {
        margin: 0px;
        padding: 14px;
        border: 2px solid @lavender;
        border-radius: 14px;
        background-color: @base;
      }

      /* Inner Box */
      #inner-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: @base;
      }

      #outer-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: @base;
      }

      #scroll {
        margin: 0px;
        padding: 10px;
        border: none;
        background-color: @base;
      }

      #input {
        margin: 5px 20px;
        padding: 14px;
        border: none;
        border-radius: 10px;
        color: @text;
        background-color: @mantle;
      }

      #input image {
          border: none;
          color: @red;
      }

      #text {
        margin: 5px;
        border: none;
        color: @text;
      }

      #entry {
        background-color: @base;
      }

      #entry arrow {
        border: none;
        color: @lavender;
      }

      #entry:selected {
        background-color: @peach;
        color: @teal;
        border-radius: 5px;
        padding: 10px 5px;
        border: none;
      }

      #entry:selected #text {
        color: @teal;
      }

      #entry:drop(active) {
        background-color: @lavender !important;
      }
      '';
  };
}
