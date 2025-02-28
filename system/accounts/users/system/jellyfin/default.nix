{ ... }:
{
  users = {
    users.jellyfin = {
      group = "jellyfin";
      extraGroups = [ "nfsShare" ];
      isSystemUser = true;
      uid = 983;
    };
    groups.jellyfin = {};
  };
}
