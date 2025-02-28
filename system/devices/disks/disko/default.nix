{ config, disko, ... }:
{
  imports = [ disko.nixosModules.disko ];

  disko.devices = {
    disk = {
      "${config.networking.hostName}" = {
        type = "disk";
        device = "/dev/mmcblk1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              size = "2G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "${config.networking.hostName}-disk";
                settings.allowDiscards = true;
                passwordFile = "/tmp/secret.key";
                content = {
                  type = "lvm_pv";
                  vg = "${config.networking.hostName}";
                };
              };
            };
          };
        };
      };
    };

    lvm_vg = {
      "${config.networking.hostName}" = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "/root" = {
                  mountpoint = "/";
                  mountOptions = [ "compress=zstd" "noatime" "ssd" ];
                };
                "/prev" = {
                  mountpoint = "/prev";
                  mountOptions = [ "compress=zstd" "noatime" "ssd" "noexec" ];
                };
                "/nix" = {
                  mountpoint = "/nix";
                  mountOptions = [ "compress=zstd" "noatime" "ssd" ];
                };

                # Impermanence
                "/persist" = {
                  mountpoint = "/persist";
                  mountOptions = [ "compress=zstd" "noatime" "ssd" ];
                };
                "/persist/.snapshots" = { };

                "/persist/home/jules" = { };
                "/persist/home/jules/.snapshots" = { };

                "/persist/home/jimbo" = { };
                "/persist/home/jimbo/.snapshots" = { };
              };
            };
          };
          swap = {
            size = "4G";
            content = {
              type = "swap";
              discardPolicy = "both";
            };
          };
        };
      };
    };
  };

  # Needed for impermanence
  fileSystems."/persist".neededForBoot = true;
}
