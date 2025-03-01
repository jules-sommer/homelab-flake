{ lib, ... }:
{
  imports = [
    ./accounts
    ./devices
    ./programs
    ./secrets
    ./services
    ./settings
  ];

  options.system = with lib; {
    server.enable = mkEnableOption "Enable server apps and services";
  };

  config = {
    networking = {
      hostName = "rubble";
      hostId = "e0b1fcef";
    };
    system.stateVersion = "24.11";
    nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  };
}
