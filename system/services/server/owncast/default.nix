{ config, ... }:
{
  imports = [ ./nginx ];

  services.owncast = {
    enable = config.system.server.enable;
    port = 8060;
    rtmp-port = 1945;
    listen = "0.0.0.0";
  };
}
