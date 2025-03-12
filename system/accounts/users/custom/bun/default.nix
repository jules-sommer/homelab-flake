{ config, pkgs, ... }:
{
  users.users.bun = {
    hashedPassword = config.secrets.bunAccPass;
    isNormalUser = true;
    createHome = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC2lMkUd+BbXITE5LTg94hEzmA6UKsIIbaf5YOjGoLzl Desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIFGHaxdTeC1xnTx2BY5LLR5LxhdSkmYoWuOeEuRIz0k Server"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJahAoF74BY6GCTsFkt1ADKaraFgJJozW1Y1aBTLK0j9 Pixel9"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHMJtG55GlIRVs6NzN9MeGZUFeduOcbOhFc0QEqWEl7o"
    ];
    extraGroups = [
      "wheel"
      "input"
      "disk"
      "dialout"
      "nginx"
      "nfsShare"
    ];
    uid = 1000;
    shell = pkgs.zsh;
  };
}
