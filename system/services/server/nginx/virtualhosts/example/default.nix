{ config, lib, ... }:
{
  services.nginx.virtualHosts = lib.mkIf config.system.server.enable {
    "www.example.com" = {
      enableACME = true;
      addSSL = true;
      default = true;
      root = "/var/www/landing-page";
    };
    "example.com" = {
      enableACME = true;
      addSSL = true;
      globalRedirect = "www.example.com";
    };
  };
}
