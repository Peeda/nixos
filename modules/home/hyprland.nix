{ config, pkgs, ...}:

let path_str = toString ../../wallpapers/forest.png; in
{
  home.packages = with pkgs; [
    rofi-wayland
    hyprpaper
    waybar
    font-awesome
    brightnessctl
    pulseaudio
  ];
  home.file.".config/hypr/hyprpaper.conf".text = 
  "preload = " + path_str + "\n" +
  "wallpaper = ," + path_str + "\n" +
  "ipc = off";
  home.sessionVariables = {
    GDK_SCALE = 2;
    XCURSOR_SIZE = 32;
  };
}
