{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
    gcc
    git
    ripgrep
    tree-sitter
    unzip
    xclip
    yarn
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
  };

  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };
}
