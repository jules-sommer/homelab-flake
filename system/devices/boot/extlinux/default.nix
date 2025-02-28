{ ... }:
{
  boot.loader = {
    grub.enable = false;
    systemd-boot.enable = false;
    generic-extlinux-compatible.enable = true;
  };
}
