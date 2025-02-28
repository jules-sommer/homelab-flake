{ config, lib, pkgs, ... }:
{
  services.nginx.virtualHosts."chat.nixfox.ca" = lib.mkIf config.services.matrix-synapse.enable {
    enableACME = true;
    addSSL = true;
    root = "${pkgs.element-web}";
  };
}
