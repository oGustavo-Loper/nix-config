{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver = {
    xkb.layout = "br";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    windowManager.i3.enable = true;
  };

  # Fix autologin bug GNOME
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}