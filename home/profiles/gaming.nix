{ pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    mesa-demos
    vulkan-tools
    libva
    libGL
    libGLU
  ];
}
