{ lib, ... }:
{
  imports = [
    ./cfdyndns
    ./fileserver
    ./forgejo
    ./mysql
    ./owncast
    ./transmission
    ./vaultwarden
    ./webserver
  ];

  options.system = with lib; {
    server.enable = mkEnableOption "Enable server apps and services";
  };
}
