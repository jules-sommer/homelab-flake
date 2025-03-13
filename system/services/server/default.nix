{ lib, ... }:
{
  imports = [
    ./cfdyndns
    ./forgejo
    ./jellyfin
    ./mysql
    ./nextcloud
    ./nfs
    ./nginx
    ./owncast
    ./transmission
    ./vaultwarden
  ];

  options.progesterone.vaultwarden.enable = with lib; mkEnableOption "Enable vaultwarden";
  options.system.server.enable = with lib; mkEnableOption "Enable server apps and services";
}
