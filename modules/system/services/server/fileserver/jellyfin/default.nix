{ config, lib, ... }:
{
  imports = [
    ./nginx
  ];

  config = lib.mkIf config.system.fileserver.enable {
    services.jellyfin.enable = true;
    environment.persistence."/persist".directories = [ "/var/lib/jellyfin" ];
  };
}
