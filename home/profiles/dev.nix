{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    neovim
    vim
    vscode
    nodejs_20
    curl
    docker
    libvirt
    claude-code
  ];
}
