{ pkgs, ... }:
{
  boot.supportedFilesystems = {
    btrfs = true;
    zfs = true;
  };

  services = {
    btrfs.autoScrub.enable = true;
    fstrim.enable = true;
  };
}
