{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/hyprland.nix
    ];
  nixpkgs.config.allowUnfreePredicate = _: true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "peter";
  home.homeDirectory = "/home/peter";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brave
    dolphin
    spotify
    neovim
    kitty
    cargo
    stow
    lazygit
    neofetch
    onefetch
    distrobox
    krabby
    starship
    ripgrep
    trashy

    rust-analyzer
    clang-tools
    lua-language-server
    nil

    cmake
    gcc
    gnumake
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/peter/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.git = {
    enable = true;
    userName = "Peter";
    userEmail = "107806301+Peeda@users.noreply.github.com";
  };
  programs.gh = {
    enable = true;
  };
  services.gammastep = {
    enable = true;
    dawnTime = "0:00-4:59";
    duskTime = "5:00-11:59";
    temperature = {
        day = 6500;
        night = 3200;
    };
  };
  programs.fish = {
    enable = true;
    shellInit = ''
    bind \cH 'backward-kill-word'
    starship init fish | source
    krabby random 1-5 --no-gmax --no-regional
    set -g fish_greeting
    export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
    '';
    shellAliases = {
      rlox = "~/Programming/crafting-interpreters/rlox/src";
      rustboy = "cd ~/Programming/rustboy/rustboy-core/src/";
      r = "sudo modprobe -r hid-multitouch && sudo modprobe hid-multitouch";
      config = "cd ~/nixos/hosts/default/";
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
