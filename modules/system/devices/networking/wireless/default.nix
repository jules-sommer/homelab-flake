{ config, lib, pkgs, ... }:
{
  options.system.wireless.enable = lib.mkEnableOption "Enable wireless stack";

  config = lib.mkIf config.system.wireless.enable {
    networking.wireless.iwd.enable = true;

    environment = {
      systemPackages = with pkgs; [ impala ];
      persistence."/persist".directories = [ "/var/lib/iwd/" ];
    };
  };
}
