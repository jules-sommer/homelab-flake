{ config, lib, ... }:
{
  services.nginx.virtualHosts = lib.mkIf config.system.server.enable {
    "www.nixfox.ca" = {
      enableACME = true;
      addSSL = true;
      default = true;
      root = "/var/www/landing-page";
    };
    "nixfox.ca" = {
      enableACME = true;
      addSSL = true;
      globalRedirect = "www.nixfox.ca";
    };
  };
}
