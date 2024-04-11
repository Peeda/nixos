{ config, lib, pkgs, ...}:

{
  options = {
    lang.rust.enable = lib.mkEnableOption "rust";
  };
  config = lib.mkIf config.lang.rust.enable {
    home.packages = [
      pkgs.rustup
    ];
  };
}
