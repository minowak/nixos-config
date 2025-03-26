{ lib, pkgs, ...}:

{
  programs.wofi = {
    enable = true;
    settings = {
      no_actions = true;
      prompt = "Search...";
    };
    style = lib.mkForce ''
      @define-color rosewater #f2d5cf;
      @define-color rosewater-rgb rgb(242, 213, 207);
      @define-color flamingo #eebebe;
      @define-color flamingo-rgb rgb(238, 190, 190);
      @define-color yellow #f4b8e4;
      @define-color yellow-rgb rgb(244, 184, 228);
      @define-color mauve #ca9ee6;
      @define-color mauve-rgb rgb(202, 158, 230);
      @define-color red #e78284;
      @define-color red-rgb rgb(231, 130, 132);
      @define-color lavender #babbf1;
      @define-color lavender-rgb rgb(186, 187, 241);
      @define-color peach #ef9f76;
      @define-color peach-rgb rgb(239, 159, 118);
      @define-color pink #ea999c;
      @define-color pink-rgb rgb(234, 153, 156);
      @define-color green #a6d189;
      @define-color green-rgb rgb(166, 209, 137);
      @define-color teal #81c8be;
      @define-color teal-rgb rgb(129, 200, 190);
      @define-color sky #99d1db;
      @define-color sky-rgb rgb(153, 209, 219);
      @define-color sapphire #85c1dc;
      @define-color sapphire-rgb rgb(133, 193, 220);
      @define-color blue #8caaee;
      @define-color blue-rgb rgb(140, 170, 238);
      @define-color maroon #ca9ee6;
      @define-color maroon-rgb rgb(202, 158, 230);
      @define-color text #c6d0f5;
      @define-color text-rgb rgb(198, 208, 245);
      @define-color subtext1 #b5bfe2;
      @define-color subtext1-rgb rgb(181, 191, 226);
      @define-color subtext0 #a5adce;
      @define-color subtext0-rgb rgb(165, 173, 206);
      @define-color overlay2 #949cbb;
      @define-color overlay2-rgb rgb(148, 156, 187);
      @define-color overlay1 #838ba7;
      @define-color overlay1-rgb rgb(131, 139, 167);
      @define-color overlay0 #737994;
      @define-color overlay0-rgb rgb(115, 121, 148);
      @define-color surface2 #626880;
      @define-color surface2-rgb rgb(98, 104, 128);
      @define-color surface1 #51576d;
      @define-color surface1-rgb rgb(81, 87, 109);
      @define-color surface0 #414559;
      @define-color surface0-rgb rgb(65, 69, 89);
      @define-color base #303446;
      @define-color base-rgb rgb(48, 52, 70);
      @define-color mantle #292c3c;
      @define-color mantle-rgb rgb(41, 44, 60);
      @define-color crust #232634;
      @define-color crust-rgb rgb(35, 38, 52);

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
