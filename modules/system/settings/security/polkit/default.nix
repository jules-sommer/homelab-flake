{ config, lib, ... }:
{
  security = lib.mkIf config.system.desktop.enable {
    polkit.enable = true;
    rtkit.enable = true;
  };
}
