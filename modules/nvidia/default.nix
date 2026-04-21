{ config, pkgs, ... }:

{
  boot.blacklistedKernelModules = [ "nouveau" ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
}