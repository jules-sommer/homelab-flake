{ config, lib, ... }:
{
  services.collabora-online.enable = config.services.nextcloud.enable;
}
