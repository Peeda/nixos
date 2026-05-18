{ self, inputs, ... }:
{
  flake.nixosModules.starship =
    { ... }:
    {
      home-manager.users.peter.programs.starship = {
        enable = true;
        settings = {
          format = "$os$username$hostname$directory$rust$fill$cmd_duration $time$line_break$character";

          os = {
            disabled = false;
            symbols.NixOS = " ";
          };

          fill.symbol = " ";

          username = {
            show_always = true;
            disabled = false;
            style_user = "#cba6f7 bold";
            format = ''[\[](red)[$user]($style)@'';
          };

          hostname = {
            ssh_only = false;
            style = "#f2cdcd bold";
            format = ''[computer]($style)[\]](red) [taking a gander at ](#eff1f5)'';
          };

          directory = {
            style = "#74c7ec bold underline";
            truncation_length = 2;
          };

          git_branch = {
            symbol = " ";
            format = ''\[[$symbol$branch]($style)\]'';
          };

          git_status.format = ''([\[$all_status$ahead_behind\]]($style))'';

          rust.format = ''\[[$symbol($version)]($style)\]'';
        };
      };
    };
}
