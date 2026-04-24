{ config, ... }:

let
  mod = "Mod4";
  wallpaper = "${config.home.homeDirectory}/nix-config/assets/wallpapers/001.jpg";
in
{
  xsession.enable = true;

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;
      terminal = "rio";

      startup = [
        {
          command = "feh --bg-fill ${wallpaper}";
          always = true;
        }
        {
          command = "ulauncher --hide-window";
          always = false;
        }
        {
          command = "xrandr --output HDMI-0 --mode 1920x1080 --rotate left --pos 0x0";
          always = true;
        }
        {
          command = "xrandr --output DP-0 --primary --mode 3440x1440 --rotate normal --pos 1080x0";
          always = true;
        }
        {
          command = "i3-msg 'workspace 1'";
          always = true;
        }
        {
          command = "i3-msg 'workspace 2'";
          always = true;
        }
      ];

      workspaceOutputAssign = [
        {
          workspace = "1";
          output = "DP-0";
        }
        {
          workspace = "2";
          output = "HDMI-0";
        }
      ];

      keybindings = {
        "${mod}+Return" = "exec rio";
        "${mod}+d" = "exec ulauncher-toggle";

        "${mod}+Shift+q" = "kill";
        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+c" = "restart";

        "${mod}+f" = "fullscreen toggle";
        "${mod}+w" = "layout toggle splith splitv tabbed stacking";

        "${mod}+space" = "exec setxkbmap -layout us";
        "${mod}+Shift+space" = "exec setxkbmap -layout br";

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

        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
      };

      bars = [
        {
          statusCommand = "i3status-rs ~/.config/i3status-rust/config.toml";
        }
      ];
    };
  };
}
