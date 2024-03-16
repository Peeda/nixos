# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/common.nix
      inputs.home-manager.nixosModules.default
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "peter" = import ./home.nix;
    };
  };
  services.logind.powerKey = "suspend";
  services.fwupd.enable = true;
  # we need fwupd 1.9.7 to downgrade the fingerprint sensor firmware
  services.fwupd.package = (import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/bb2009ca185d97813e75736c2b8d1d8bb81bde05.tar.gz";
    sha256 = "sha256:003qcrsq5g5lggfrpq31gcvj82lb065xvr7bpfa8ddsw8x4dnysk";
  }) {
    inherit (pkgs) system;
  }).fwupd;
  hardware.framework.amd-7040.preventWakeOnAC = true;

  system.stateVersion = "23.11"; # Did you read the comment?

}
