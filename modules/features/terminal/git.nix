{ self, inputs, ... }:
{
  flake.nixosModules.git =
    { ... }:
    {
      home-manager.users.peter = {
        programs.git = {
          enable = true;
          settings.user.name = "Peeda";
          settings.user.email = "107806301+Peeda@users.noreply.github.com";
        };
        programs.gh = {
          enable = true;
          settings.hosts."github.com".user = "Peeda";
        };
      };
    };
}
