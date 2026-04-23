{ config, pkgs, ... }:

{
  home.username = "gustavo";
  home.homeDirectory = "/home/gustavo";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  ########################################
  # PACOTES DO USUÁRIO
  ########################################
  home.packages = with pkgs; [
    git
    neovim
    brave
    rio
    feh
    ulauncher
    rofi
  ];

  ########################################
  # XSESSION / I3
  ########################################
  xsession.enable = true;

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = "Mod4";
      terminal = "rio";

      ########################################
      # ATALHOS
      ########################################
      keybindings = let
        mod = "Mod4";
      in {
        # terminal
        "${mod}+Return" = "exec rio";

        # launcher
        "${mod}+d" = "exec ulauncher-toggle";

        # fechar janela
        "${mod}+Shift+q" = "kill";

        # reload
        "${mod}+Shift+r" = "reload";

        # restart
        "${mod}+Shift+c" = "restart";

        # fullscreen
        "${mod}+f" = "fullscreen toggle";

        # alternar idioma
        "${mod}+space" =
          "exec setxkbmap -layout br,us -option grp:alt_shift_toggle";

        # workspaces
        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+0" = "workspace 10";

        # mover janela
        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";
        "${mod}+Shift+0" = "move container to workspace 10";

        # navegação estilo vim
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
      };

      ########################################
      # STARTUP
      ########################################
      startup = [
        {
          command = "feh --bg-fill /home/gustavo/nix-config/assets/wallpapers/wallpaper1.jpg";
          always = true;
        }
        {
          command = "ulauncher --hide-window";
          always = false;
        }
      ];

      ########################################
      # BARRA
      ########################################
      bars = [
        {
          statusCommand = "i3status";
        }
      ];
    };
  };

  ########################################
  # ARQUIVOS DO USUÁRIO
  ########################################
  home.file = { };

}