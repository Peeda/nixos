{ config, lib, pkgs, ...}:

{
  imports = [
    ./rust.nix
    ./cpp.nix
    ./ocaml.nix
  ];
  lang.rust.enable = lib.mkDefault false;
  lang.cpp.enable = lib.mkDefault false;
  lang.ocaml.enable = lib.mkDefault false;
}
