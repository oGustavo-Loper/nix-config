{ config, pkgs, ... }:

{
  home.username = "gustavo";
  home.homeDirectory = "/home/gustavo";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    neovim
    brave
    rio
  ];
}
