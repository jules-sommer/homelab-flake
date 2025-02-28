{ ... }:
{
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/secureboot"
      "/var"
    ];
    files = [
      "/etc/machine-id"
      "/root/.gitconfig"
    ];
  };
}
