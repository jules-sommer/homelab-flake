{ config, lib, ... }:
{
  services.nginx.virtualHosts."matrix.jimbosfiles.com" = lib.mkIf config.services.matrix-synapse.enable {
    enableACME = true;
    forceSSL = true;
    locations = {
      "/".extraConfig = ''return 403;'';
      "/client".proxyPass = "http://127.0.0.1:8008";
      "/_matrix".proxyPass = "http://127.0.0.1:8008";
      "/_synapse/client".proxyPass = "http://127.0.0.1:8008";
    };
  };
}
