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
      openssh.authorizedKeys.keyFiles = [
        ../../../../../../hosts/tower/id_ed25519.pub

        ../../../../../../hosts/envy/id_ed25519.pub
        ../../../../../../hosts/redmond/id_ed25519.pub

        ../../../../../../hosts/kitty/id_ed25519.pub
        ../../../../../../hosts/midas/id_ed25519.pub
        ../../../../../../hosts/prophet/id_ed25519.pub
        ../../../../../../hosts/rubble/id_ed25519.pub
      ];
      openssh.authorizedKeys.keys = [
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
        "minecraft"
        "nfsShare"
      ];
      uid = 1000;
      shell = pkgs.zsh;
    };

    home-manager.users."${config.sysusers.main}" = import ../../../../../home;
  };
}
