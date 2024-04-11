{ config, lib, pkgs, ...}:

{
  options = {
    lang.cpp.enable = lib.mkEnableOption "cpp";
  };
  config = lib.mkIf config.lang.cpp.enable {
    home.packages = with pkgs; [
      gnumake
      cmake
      gcc
    ];
  };
}
