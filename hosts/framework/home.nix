{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/home/common.nix
      ../../modules/home/hyprland.nix
      ../../modules/home/languages/mod.nix
    ];
    lang.cpp.enable = true;
    home.packages = with pkgs; [
      powertop
    ];
}
