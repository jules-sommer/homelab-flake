{ config, ... }:
{
  imports = [ ./nginx ];

  services.jellyfin.enable = config.system.server.enable;
}
