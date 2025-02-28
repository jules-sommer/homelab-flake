{ ... }:
{
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/ssh/"
      "/var"
    ];
    files = [
      "/etc/machine-id"
      "/root/.gitconfig"
    ];
  };
}
