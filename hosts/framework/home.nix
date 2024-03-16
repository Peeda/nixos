{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/homecommon.nix
      ../../modules/hyprland.nix
    ];
    home.packages = with pkgs; [
      powertop
    ];
}
