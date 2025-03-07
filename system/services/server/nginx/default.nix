{ config, lib, ... }:
{
  imports = [ ./virtualhosts ];

  services.nginx = {
    enable = config.system.server.enable;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
