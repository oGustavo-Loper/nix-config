{ lib, osConfig, ... }:

let
  hostName = osConfig.networking.hostName;
in
{
  imports =
    [
      ./i3
      ./nvim
      ./profiles/workstation.nix
      ./profiles/dev.nix
    ]
    ++ lib.optionals (hostName == "desktop") [
      ./profiles/gaming.nix
    ];

  home.username = "gustavo";
  home.homeDirectory = "/home/gustavo";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
