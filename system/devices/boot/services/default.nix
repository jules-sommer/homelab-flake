{ ... }:
{
  imports = [ ./root-reset ];

  boot.initrd.systemd.enable = true;
}
