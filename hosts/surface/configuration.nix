# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/system/common.nix
      inputs.home-manager.nixosModules.default
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "peter" = import ./home.nix;
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
