{ config, lib, ... }:
{
  imports = [
    ./rtmp
    ./virtualhosts
  ];

  config = lib.mkIf config.system.server.enable {
    services.nginx = {
      enable = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
      recommendedProxySettings = true;
    };

    environment.persistence."/persist".directories = [ "/var/www" ];

    networking.firewall.allowedTCPPorts = [
      80
      443
    ];
  };
}
