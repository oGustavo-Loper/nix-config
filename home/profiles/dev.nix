{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    vim
    vscode
    nodejs_20
    curl
    docker
    libvirt
    claude-code
  ];
}
