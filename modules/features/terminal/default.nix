{ self, ... }:
{
  flake.nixosModules.terminal = {
    imports = [
      self.nixosModules.fish
      self.nixosModules.starship
      self.nixosModules.ghostty
      self.nixosModules.git
    ];
  };
}
