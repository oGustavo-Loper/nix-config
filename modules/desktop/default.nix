{ ... }:

{
  services.xserver.enable = true;

  services.xserver = {
    xkb.layout = "br";

    windowManager.i3.enable = true;
  };

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Fix autologin bug GNOME
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
