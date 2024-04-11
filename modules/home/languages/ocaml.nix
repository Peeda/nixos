{ config, lib, pkgs, ...}:

{
  options = {
    lang.ocaml.enable = lib.mkEnableOption "ocaml";
  };
  config = lib.mkIf config.lang.ocaml.enable {
    home.packages = with pkgs; [ 
      opam
      dune_3
    ] ++ ( with ocamlPackages;
    [
      ocaml
      utop
      ocamlformat
    ]);
  };
}
