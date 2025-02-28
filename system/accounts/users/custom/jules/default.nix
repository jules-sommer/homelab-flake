{ config, lib, pkgs, ... }:
{
  users.users.jules = {
    hashedPassword = config.secrets.mainAccPass;
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHwxJcAWuHkKy/Ar37aIoqg34CDcZu7/bh978nYkOgzj jules@jules-pc"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEOszCNP+6rkIS75GyFVhn9o6QpUuGdx/J4rjzROrpSl jules@xeta"
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
    uid = 1001;
    shell = pkgs.fish;
  };

  #home-manager.users.jimbo = import ../../../../../home/jimbo;
}
