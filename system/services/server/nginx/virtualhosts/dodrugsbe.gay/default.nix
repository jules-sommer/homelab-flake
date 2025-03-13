{ config, lib, ... }:
{
  services.nginx.virtualHosts = lib.mkIf config.services.nginx.enable {
    "www.dodrugsbe.gay" = {
      enableACME = true;
      addSSL = true;
      default = true;
      root = "/var/www/dodrugsbe.gay";
    };
    "dodrugsbe.gay" = {
      enableACME = true;
      addSSL = true;
      globalRedirect = "www.dodrugsbe.gay";
    };
  };
}
