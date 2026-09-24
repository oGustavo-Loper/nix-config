{ ... }:

{
  users.users.gustavo = {
    isNormalUser = true;
    description = "Gustavo";

    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "kvm"
      "docker"
    ];
  };
}
