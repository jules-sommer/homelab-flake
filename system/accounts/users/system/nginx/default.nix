{ ... }:
{
  users = {
    users.nginx = {
      group = "nginx";
      extraGroups = [ "virtualMail" ];
      isSystemUser = true;
      uid = 60;
    };
    groups.nginx = {};
  };
}
