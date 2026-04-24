{ lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  console.keyMap = "br-abnt2";

  services.printing.enable = true;
  services.openssh.enable = true;

  programs.firefox.enable = true;
  programs.nix-ld.enable = true;

  boot.kernelModules = [ "kvm" ];

  system.stateVersion = lib.mkDefault "24.05";
}
