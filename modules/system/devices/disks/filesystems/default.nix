{ pkgs, ... }:
{
  boot.supportedFilesystems = {
    btrfs = true;
    ntfs = true;
    zfs = true;
  };

  services = {
    btrfs.autoScrub.enable = true;
    fstrim.enable = true;
  };
}
