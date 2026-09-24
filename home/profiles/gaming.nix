{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mesa-demos
    vulkan-tools
    libva
    libGL
    libGLU
  ];
}
