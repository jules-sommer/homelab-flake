{ config, lib, ... }:
{
  services.nginx.virtualHosts."cloud.example.com" = lib.mkIf config.services.nextcloud.enable {
    enableACME = true;
    addSSL = true;
    locations."/" = {
      proxyWebsockets = true;
      extraConfig = ''
        location /.well-known/carddav {
          return 301 $scheme://$host/remote.php/dav;
        }
        location /.well-known/caldav {
          return 301 $scheme://$host/remote.php/dav;
        }
     '';
    };
  };
}
