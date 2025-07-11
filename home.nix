{pkgs, inputs, ...}:

{
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    neofetch
    neovim
  ];
}
