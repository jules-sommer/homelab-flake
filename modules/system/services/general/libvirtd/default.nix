{ config, lib, pkgs, ... }:
{
  options.system.libvirtd.enable = lib.mkEnableOption "Enable libvirtd services";

  config = lib.mkIf config.system.libvirtd.enable {
    virtualisation.libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu = {
        ovmf = {
          enable = true;
          packages = with pkgs; [ OVMFFull.fd ];
        };
        vhostUserPackages = with pkgs; [ virtiofsd ];
        swtpm.enable = true;
      };
    };

    programs.virt-manager.enable = true;

    environment.persistence."/persist".directories = [
      "/var/lib/libvirt/dnsmasq"
      "/var/lib/libvirt/nwfilter"
      "/var/lib/libvirt/qemu"
      "/var/lib/libvirt/secrets"
      "/var/lib/libvirt/storage"
      "/var/lib/libvirt/swtpm"
    ];

    # Needed to make NAT work
    networking.firewall.trustedInterfaces = [
      "virbr0"
      "virbr1"
    ];

    systemd.tmpfiles.rules = [ "f /dev/shm/looking-glass 0660 - libvirtd -" ];
  };
}
