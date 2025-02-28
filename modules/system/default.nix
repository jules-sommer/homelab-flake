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
    desktop.enable = lib.mkEnableOption "Enable desktop apps and services";
    server.enable = lib.mkEnableOption "Enable server apps and services";
  };
}
