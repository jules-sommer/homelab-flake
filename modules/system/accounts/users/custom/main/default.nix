{ config, lib, pkgs, ... }:
{
  options.sysusers = lib.mkOption {
    type = lib.types.attrs;
  };

  config = {
    sysusers.main = "jimbo";

    users.users."${config.sysusers.main}" = {
      hashedPassword = config.secrets.mainAccPass;
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC2lMkUd+BbXITE5LTg94hEzmA6UKsIIbaf5YOjGoLzl"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIFGHaxdTeC1xnTx2BY5LLR5LxhdSkmYoWuOeEuRIz0k"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJahAoF74BY6GCTsFkt1ADKaraFgJJozW1Y1aBTLK0j9 Pixel9"
      ];
      extraGroups = [
        "wheel"
        "audio"
        "video"
        "input"
        "disk"
        "dialout"
        "rtkit"
        "kvm"
        "libvirtd"
        "qemu-libvirtd"
        "nginx"
        "nfsShare"
      ];
      uid = 1000;
      shell = pkgs.zsh;
    };

    home-manager.users."${config.sysusers.main}" = import ../../../../../home;
  };
}
