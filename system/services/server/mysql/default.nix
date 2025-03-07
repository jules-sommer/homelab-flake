{ config, pkgs, ... }:
{
  services.mysql = {
    enable = config.system.server.enable;
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
