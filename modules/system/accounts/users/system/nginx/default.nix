{ ... }:
{
  users = {
    users.nginx = {
      group = "nginx";
      extraGroups = [
        "turnserver"
        "virtualMail"
      ];
      isSystemUser = true;
      uid = 60;
    };
    groups.nginx = {};
  };
}
