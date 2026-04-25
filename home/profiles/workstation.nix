{ pkgs, ... }:

{
  home.packages = with pkgs; [
    anydesk
    brave
    discord
    flameshot
    gnome-boxes
    i3lock-color
    obsidian
    open-vm-tools
    spotify
    vmware-workstation
  ];
}
