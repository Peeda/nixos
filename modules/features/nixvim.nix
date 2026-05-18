{ self, inputs, ... }:
{
  flake.nixosModules.nixvim =
    { ... }:
    {
      home-manager.users.peter = {
        imports = [ inputs.nixvim.homeManagerModules.default ];
        programs.nixvim.enable = true;
      };
    };
}
