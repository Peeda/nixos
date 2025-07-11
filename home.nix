{pkgs, inputs, ...}:

{
  programs = {
    git = {
      enable = true;
      userName = "Peter";
      userEmail = "107806301+Peeda@users.noreply.github.com";
    };
    fish = {
      enable = true;
      shellAliases = {
        ls = "eza --icons";
        rebuild = "sudo nixos-rebuild switch --flake $HOME/nixos";
      };
      shellInit = ''
        bind \cH 'backward-kill-word'
        krabby random 1-5 --no-gmax --no-regional
      '';
    };
    ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        window-decoration = false;
        fullscreen = true;
        mouse-hide-while-typing = true;
        font-size = 12;
      };
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
  };
  home =
  let dotfiles_repo = builtins.fetchGit {
      url = "https://github.com/Peeda/Dotfiles";
      ref = "master";
      rev = "9295ea819f36414c146d5530326ebe80bc45044e";
  }; 
  in {
    stateVersion = "25.05";
    packages = with pkgs; [
      stow
      krabby
      eza

      gh
      neofetch
      neovim
    ];
    file.".config/starship.toml".source = "${dotfiles_repo}/starship/.config/starship.toml";
  };
}
