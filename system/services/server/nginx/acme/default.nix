{ config, lib, ... }:
{
  security.acme = lib.mkIf config.services.nginx.enable {
    acceptTerms = true;
    defaults.email = "contact@example.com";
  };
}
