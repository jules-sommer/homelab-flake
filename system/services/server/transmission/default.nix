{ config, pkgs, ... }:
{
  imports = [ ./nginx ];

  services.transmission = {
    enable = config.system.server.enable;
    credentialsFile = pkgs.writeText "credentials" config.secrets.transmissionCredFile;
    openPeerPorts = true;
    settings.rpc-authentication-required = true;
  };
}
