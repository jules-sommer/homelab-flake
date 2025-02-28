{ config, ... }:
{
  services.nfs.server = {
    enable = config.system.fileserver.enable;
    exports = ''
      /export/KittyNFS/Files *(rw,sync,no_subtree_check)
      /export/KittyNFS/Media *(rw,sync,no_subtree_check)
      /export/KittyNFS/Music *(rw,sync,no_subtree_check)
    '';
  };
}
