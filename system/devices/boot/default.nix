{ ... }:
{
  imports = [
    ./extlinux
    ./root-reset
  ];

  boot.initrd.systemd.enable = true;
}
