{ config, pkgs, ... }:

{
  home.username = "gustavo";
  home.homeDirectory = "/home/gustavo";

  home.stateVersion = "25.05";

  home.file.".fehbg".text = ''
    feh --randomize --bg-fill ~/nix-config/assets/wallpapers/*
  '';

  programs.home-manager.enable = true;

  ########################################
  # 📦 PACOTES
  ########################################
  home.packages = with pkgs; [
    git
    neovim
    brave
    rio
    rofi
    feh
  ];

  ########################################
  # 🪟 I3
  ########################################
  xsession.enable = true;

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = "Mod4";
      terminal = "rio";

      startup = [
        { command = "~/.fehbg"; always = true; }
      ];

      keybindings = {
        "Mod4+d" = "exec rofi -show drun";
      };

      bars = [
        {
          statusCommand = "i3status-rs";
        }
      ];
    };
  };

  ########################################
  # 📊 I3STATUS-RUST (AQUI ESTÁ A MÁGICA)
  ########################################
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
              format = "%H:%M";
            }
          ];
        };
      };
    };
  };
}