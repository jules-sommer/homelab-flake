{ config, lib, ... }:
{
  imports = [ ./nginx ];

  config = lib.mkIf config.system.socialserver.enable {
    services.owncast = {
      enable = true;
      port = 8060;
      rtmp-port = 1945;
      listen = "0.0.0.0";
    };
    environment.persistence."/persist".directories = [
      "/var/lib/owncast"
    ];
  };
}
