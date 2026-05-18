{ self, inputs, ... }:
{
  flake.nixosModules.ghostty =
    { ... }:
    {
      home-manager.users.peter.programs.ghostty = {
        enable = true;
        settings.window-decoration = false;
        settings.fullscreen = true;
        settings.mouse-hide-while-typing = true;
        settings.font-size = 12;
        settings.font-family = "JetBrainsMono Nerd Font";
      };
    };
}
