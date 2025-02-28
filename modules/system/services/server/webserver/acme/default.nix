{ config, lib, ... }:
{
  config = lib.mkIf config.services.nginx.enable {
    security.acme = { 
      acceptTerms = true;
      defaults.email = "contact@nixfox.ca";
    };
    environment.persistence."/persist".directories = [ "/var/lib/acme" ];
  };
}
