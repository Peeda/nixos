{ self, inputs, ... }:
{
  flake.nixosModules.fish =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      programs.fish.enable = true;
      users.users.peter.shell = pkgs.fish;

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.peter = {
        programs.fish = {
          enable = true;
          shellAliases.ls = "eza --icons";
          interactiveShellInit = ''
            set fish_greeting
            bind \cH 'backward-kill-word'
            krabby random 1-5 --no-gmax --no-regional
          '';
        };
        home.packages = with pkgs; [
          eza
          krabby
          lazygit
          vscode.fhs
          brave
          conda
          zip
          unzip
          powertop
          sysstat
          vim
          python3
        ];
        home.stateVersion = "25.11";
      };
    };
}
