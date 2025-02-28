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

    # Needed to make NAT work
    networking.firewall.trustedInterfaces = [
      "virbr0"
      "virbr1"
    ];
  };
}
