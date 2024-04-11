{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/home/common.nix
      ../../modules/home/hyprland.nix
    ];
}
