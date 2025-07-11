{config, pkgs, ...}:
{
  fileSystems."/home/peter/nixos" = {
    device = "nixos";
    fsType = "virtiofs";
  };
  networking.hostName = "nixvm";
  networking.nameservers = ["8.8.8.8" "4.4.4.4"];
}
