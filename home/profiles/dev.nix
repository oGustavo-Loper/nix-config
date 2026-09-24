{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    vim
    vscode
    nodejs
    curl
    claude-code
  ];
}
