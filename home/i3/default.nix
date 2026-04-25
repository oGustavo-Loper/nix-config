{ lib, pkgs, ... }:

let
  mod = "Mod4";
  workspaceNumbers = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" ];
  workspaceKeys = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
  monitorLayouts = [
    {
      output = "HDMI-0";
      mode = "1920x1080";
      rotate = "left";
      pos = "0x180";
      primary = false;
    }
    {
      output = "DP-0";
      mode = "3440x1440";
      rotate = "normal";
      pos = "1080x0";
      primary = true;
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
  wallpaperDir = ../../assets/wallpapers;
  randomWallpaperScript = pkgs.writeShellScript "set-random-wallpaper" ''
    wallpapers="${
      wallpaperDir
    }"
    wallpaper="$(${pkgs.findutils}/bin/find "$wallpapers" -maxdepth 1 -type f \( -name '*.jpg' -o -name '*.png' \) | ${pkgs.coreutils}/bin/shuf -n 1)"

    if [ -n "$wallpaper" ]; then
      exec ${pkgs.feh}/bin/feh --bg-fill "$wallpaper"
    fi
  '';
  monitorCommand =
    monitor:
    let
      primaryFlag = if monitor.primary then " --primary" else "";
    in
    "xrandr --output ${monitor.output}${primaryFlag} --mode ${monitor.mode} --rotate ${monitor.rotate} --pos ${monitor.pos}";
  workspaceBindings =
    builtins.listToAttrs (
      lib.flatten (
        lib.zipListsWith
          (key: workspace: [
            {
              name = "${mod}+${key}";
              value = "workspace ${workspace}";
            }
            {
              name = "${mod}+Shift+${key}";
              value = "move container to workspace ${workspace}";
            }
          ])
          workspaceKeys
          workspaceNumbers
      )
    );
in
{
  home.packages = with pkgs; [
    feh
    i3status-rust
    rofi
    rio
    setxkbmap
    ulauncher
    xrandr
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

  xsession.enable = true;

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;
      terminal = "rio";

      startup = [
        {
          command = "${randomWallpaperScript}";
          always = true;
        }
        {
          command = "ulauncher --hide-window";
          always = false;
        }
      ]
      ++ map (monitor: {
        command = monitorCommand monitor;
        always = true;
      }) monitorLayouts
      ++ map (workspace: {
        command = "i3-msg 'workspace ${workspace.workspace}'";
        always = true;
      }) workspaceOutputAssign;

      workspaceOutputAssign = workspaceOutputAssign;

      keybindings = workspaceBindings // {
        "${mod}+Return" = "exec rio";
        "${mod}+d" = "exec ulauncher-toggle";

        "${mod}+Shift+q" = "kill";
        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+c" = "restart";

        "${mod}+f" = "fullscreen toggle";
        "${mod}+w" = "layout toggle splith splitv tabbed stacking";

        "${mod}+space" = "exec setxkbmap -layout us";
        "${mod}+Shift+space" = "exec setxkbmap -layout br";

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
