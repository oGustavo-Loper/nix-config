{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system
    ../../modules/desktop
    ../../modules/audio
    ../../modules/users/gustavo
    ./hardware-configuration.nix
  ];

  networking.hostName = "notebook";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.05";
}
