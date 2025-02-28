{ config, lib, pkgs, ... }:
{
  services.mysql = lib.mkIf config.system.server.enable {
    enable = true;
    package = pkgs.mariadb;
    ensureDatabases = [
      "minecraft"
    ];
    ensureUsers = [
      {
        name = "minecraft";
        ensurePermissions = {
          "minecraft.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
