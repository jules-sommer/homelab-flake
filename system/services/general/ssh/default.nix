{ lib, ... }:
{
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = lib.mkForce "no";
        PrintLastLog = "no";
        PasswordAuthentication = false;
        UsePAM = false;
        X11Forwarding = false;
      };
    };
    fail2ban = {
      enable = true;
      maxretry = 5;
      bantime = "10m";
    };
  };
}
