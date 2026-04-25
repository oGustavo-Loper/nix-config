{ ... }:

{
  users.users.gustavo = {
    isNormalUser = true;
    description = "Gustavo";

    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirt"
      "kvm"
    ];
  };
}
