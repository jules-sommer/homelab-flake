{ config, lib, ... }:
{
  imports = [ ./virtualhosts ];

  config = lib.mkIf config.system.server.enable {
    services.nginx = {
      enable = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
      recommendedProxySettings = true;
    };

    networking.firewall.allowedTCPPorts = [
      80
      443
    ];
  };
}
