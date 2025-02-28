{ config, lib, ... }:
{
  services.nginx.virtualHosts."git.nixfox.ca" = lib.mkIf config.services.forgejo.enable {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:3110";
      proxyWebsockets = true;
    };
  };
}
