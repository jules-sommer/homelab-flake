{ ... }:
{
  services.fail2ban = {
    enable = true;
    maxretry = 5;
    bantime = "10m";
  };

  environment.persistence."/persist".directories = [ "/var/lib/fail2ban" ];
}
