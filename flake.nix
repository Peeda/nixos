{
  description = "My nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {self, nixpkgs, home-manager, ...}: {
    nixosConfigurations.nixvm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.default
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            users.peter = import ./home.nix;
            #extraSpecialArgs = {inherit inputs;};
          };
        }
      ];
    };
  };
}
