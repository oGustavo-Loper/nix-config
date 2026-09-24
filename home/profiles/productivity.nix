{ pkgs, ... }:

{
  home.packages = with pkgs; [
    anydesk
    brave
    discord
    flameshot
    i3lock-color
    obsidian
    spotify
  ];
}
