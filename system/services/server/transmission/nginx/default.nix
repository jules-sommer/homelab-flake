{ config, lib, ... }:
{
  services.nginx.virtualHosts."tor.example.com" = lib.mkIf config.services.transmission.enable {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:9091";
      proxyWebsockets = true;
    };
  };
}
