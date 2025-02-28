{ config, pkgs, ... }:
{
  services.cloudflare-dyndns = {
    enable = config.system.server.enable;
    apiTokenFile = "${pkgs.writeText "cloudflareapikey" config.secrets.flareApiKey}";
  };
}
