{ config, lib, ... }:
{
  services.nginx.virtualHosts."live.nixfox.ca" = lib.mkIf config.services.owncast.enable {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:8060";
      proxyWebsockets = true;
    };
  };
}
