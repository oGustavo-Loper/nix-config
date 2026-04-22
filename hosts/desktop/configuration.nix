{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system
    ../../modules/desktop
    ../../modules/audio
    ../../modules/nvidia
    ../../modules/virtualization
    ../../modules/vmware
    ../../modules/users/gustavo

    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";

  services.xserver.windowManager.i3.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}