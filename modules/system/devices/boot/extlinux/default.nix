{ config, lib, ... }:
{
  options.system.extlinux.enable = lib.mkEnableOption "Enable extlinux";

  config.boot.loader = lib.mkIf config.system.extlinux.enable {
    grub.enable = false;
    systemd-boot.enable = lib.mkForce false;
    generic-extlinux-compatible.enable = true;
  };
}
