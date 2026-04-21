{ config, pkgs, ... }:

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

    packages = with pkgs; [
      spotify
      brave
      discord
      rio
      vscode
      vim
      neovim
      obsidian
      git
      steam
      gnome-boxes
      libvirt
      vmware-workstation
      docker
      mesa-demos
      vulkan-tools
      libva
      libGL
      libGLU
      nodejs_20
      curl
      anydesk
      rofi
      open-vm-tools
      ulauncher
      flameshot
      i3lock-color
      feh
    ];
  };
}