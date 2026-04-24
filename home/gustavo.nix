{ config, pkgs, ... }:

{
  imports = [
    ./i3
  ];

  home.username = "gustavo";
  home.homeDirectory = "/home/gustavo";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    neovim
    brave
    rio
    feh
    rofi
    ulauncher
    i3status-rust
    xrandr
    setxkbmap
    claude-code
  ];

  programs.i3status-rust = {
    enable = true;

    bars = {
      default = {
        settings = {
          theme = {
            theme = "dracula";
          };

          icons = "awesome6";

          blocks = [
            { block = "cpu"; }
            { block = "memory"; }
            { block = "disk_space"; path = "/"; }
            {
              block = "time";
              interval = 60;
              format = "%d/%m %H:%M";
            }
          ];
        };
      };
    };
  };
}
