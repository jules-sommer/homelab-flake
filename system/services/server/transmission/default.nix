{ config, lib, pkgs, ... }:
{
  imports = [ ./nginx ];

  config = lib.mkIf config.system.server.enable {
    services.transmission = {
      enable = true;
      credentialsFile = pkgs.writeText "credentials" config.secrets.transmissionCredFile;
      openPeerPorts = true;
      settings.rpc-authentication-required = true;
    };
    environment.persistence."/persist".directories = [
      "/var/lib/transmission"
    ];
  };
}
