{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/homecommon.nix
      ../../modules/hyprland.nix
    ];
}
