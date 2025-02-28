{ ... }:
{
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/secureboot"
      "/var/lib/nixos"
    ];
    files = [
      "/etc/machine-id"
      "/root/.gitconfig"
    ];
  };
}
