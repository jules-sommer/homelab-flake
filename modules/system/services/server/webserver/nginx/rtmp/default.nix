{ config, lib, pkgs, ... }:
{
  options.services.nginx.rtmp.enable = lib.mkEnableOption "Enable an RTMP server using Nginx";

  config = lib.mkIf config.services.nginx.rtmp.enable {
    services.nginx = {
      package = (pkgs.nginx.override {
        modules = with pkgs.nginxModules; [ rtmp ];
      });
      appendConfig = ''
        rtmp {
          server {
            listen 1935;
            chunk_size 4096;
            allow publish all;
            application stream {
              record off;
              live on;
              allow play all;
              hls on;
              hls_path /var/www/landing-page/streams/hls/;
              hls_fragment_naming system;
              hls_fragment 3;
              hls_playlist_length 40;
            }
          }
        }
      '';
    };
    systemd.services.nginx.serviceConfig.ReadWritePaths = [ "/var/www/landing-page/streams/hls/" ];
  };
}
