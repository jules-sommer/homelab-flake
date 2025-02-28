{ config, lib, pkgs, ... }:
{
  users.users.jimbo = {
    hashedPassword = config.secrets.mainAccPass;
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC2lMkUd+BbXITE5LTg94hEzmA6UKsIIbaf5YOjGoLzl"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIFGHaxdTeC1xnTx2BY5LLR5LxhdSkmYoWuOeEuRIz0k"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJahAoF74BY6GCTsFkt1ADKaraFgJJozW1Y1aBTLK0j9 Pixel9"
    ];
    extraGroups = [
      "wheel"
      "input"
      "disk"
      "dialout"
      "kvm"
      "libvirtd"
      "qemu-libvirtd"
      "nginx"
      "nfsShare"
    ];
    uid = 1000;
    shell = pkgs.zsh;
  };

  home-manager.users.jimbo = import ../../../../../home/jimbo;
}
