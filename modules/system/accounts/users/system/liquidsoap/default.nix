{ ... }:
{
  users = {
    users.liquidsoap = {
      group = "liquidsoap";
      extraGroups = [ "nginx" ];
      isSystemUser = true;
      uid = 155;
    };
    groups.liquidsoap = {};
  };
}
