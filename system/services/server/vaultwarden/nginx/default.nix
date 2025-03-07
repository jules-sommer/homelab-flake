{ config, lib, ... }:
{
  services.nginx.virtualHosts."pass.example.com" = lib.mkIf config.services.vaultwarden.enable {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:8222";
      proxyWebsockets = true;
    };
  };
}
