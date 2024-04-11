{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/home/common.nix
      ../../modules/home/hyprland.nix
    ];
    home.packages = with pkgs; [
      powertop
    ];
}
