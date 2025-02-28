{ lib, ... }:
{
  imports = [ ./fail2ban ];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = lib.mkForce "no";
      PrintLastLog = "no";
      PasswordAuthentication = false;
      UsePAM = false;
      X11Forwarding = false;
    };
  };

  environment.persistence."/persist".files = [
    "/etc/ssh/ssh_host_ed25519_key"
    "/etc/ssh/ssh_host_ed25519_key.pub"
    "/etc/ssh/ssh_host_rsa_key"
    "/etc/ssh/ssh_host_rsa_key.pub"
  ];
}
