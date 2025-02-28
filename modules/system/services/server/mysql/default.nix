{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.system.server.enable {
    services.mysql = {
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
    environment.persistence."/persist".directories = [
      "/var/lib/mysql"
    ];
  };
}
