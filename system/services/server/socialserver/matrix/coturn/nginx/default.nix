{ config, lib, ... }:
{
  config = lib.mkIf config.services.coturn.enable {
    services.nginx.virtualHosts."turn.jimbosfiles.com" = {
      enableACME = true;
      forceSSL = true;
      listen = [{
        addr = "0.0.0.0";
        port = 80;
        ssl = false; 
      }];
      locations."/".proxyPass = "http://127.0.0.1:1380";
    };

    security.acme.certs = {       
      "turn.jimbosfiles.com" = {
        group = "turnserver";
        postRun = "systemctl restart coturn.service";
      };
    };
  };
}
