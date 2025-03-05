{ lib, ... }:
{
  imports = [
    ./cfdyndns
    ./forgejo
    ./jellyfin
    ./mysql
    ./nextcloud
    ./nfs
    ./owncast
    ./transmission
    ./vaultwarden
    ./webserver
  ];

  options.system.server.enable = with lib; mkEnableOption "Enable server apps and services";
}
