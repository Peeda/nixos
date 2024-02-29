{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    rofi
    hyprpaper
    waybar
    font-awesome
    brightnessctl
    pulseaudio
    copyq
  ];
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/nixos/wallpapers/serenity.jpeg
    wallpaper = eDP-1,~/nixos/wallpapers/serenity.jpeg
  '';
}
