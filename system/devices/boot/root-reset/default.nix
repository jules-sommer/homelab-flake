{ config, ... }:
{
  boot.initrd.systemd.services.root-reset = {
    enable = true;
    description = "Create new and snapshot previous root";
    wantedBy = [ "initrd.target" ];
    before = [ "sysroot.mount" ];
    after = [ "initrd-root-device.target" ];
    unitConfig.DefaultDependencies = "no";
    serviceConfig.Type = "oneshot";
    script = ''
      mkdir -p /mnt
      mount -t btrfs /dev/${config.networking.hostName}/root /mnt

      if [[ -e /mnt/prev ]]; then
        btrfs subvolume delete /mnt/prev
      fi

      btrfs subvolume snapshot /mnt/root /mnt/prev

      btrfs subvolume list -o /mnt/root | cut -f9 -d' ' | while read subvolume; do
        btrfs subvolume delete "/mnt/$subvolume"
      done

      btrfs subvolume delete /mnt/root
      btrfs subvolume create /mnt/root

      umount /mnt
    '';
  };
}
