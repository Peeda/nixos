{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    rofi
    hyprpaper
    waybar
    font-awesome
    brightnessctl
    pulseaudio
  ];
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/nixos/wallpapers/gamecube.jpg
    wallpaper = ,~/nixos/wallpapers/gamecube.jpg
    ipc = off
  '';
}
