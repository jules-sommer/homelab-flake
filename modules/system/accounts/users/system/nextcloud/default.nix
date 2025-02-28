{ ... }:
{
  users = {
    users.nextcloud = {
      group = "nextcloud";
      extraGroups = [ "nfsShare" ];
      isSystemUser = true;
      uid = 218;
    };
    groups.nextcloud = {};
  };
}
