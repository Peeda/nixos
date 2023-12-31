{

    description = "Main flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.05";
        nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
        home-manager.url = "github:nix-community/home-manager/release-23.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ...}:
        let 
        lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations.nixos = lib.nixosSystem {
            inherit system;
            modules = [./configuration.nix];
        };
        homeConfigurations.peter = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [./home.nix];
        };
    };
}
