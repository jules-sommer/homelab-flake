{ lib, ... }: 
{
  options.system.fileserver.enable = lib.mkEnableOption "Enable file serving services";

  imports = [
    ./jellyfin
    ./nextcloud
    ./nfs
  ];
}
