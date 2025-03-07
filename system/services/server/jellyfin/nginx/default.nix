{ config, lib, ... }:
{
  services.nginx.virtualHosts."jelly.example.com" = lib.mkIf config.services.forgejo.enable {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:8096";
      proxyWebsockets = true;
    };
  };
}
