{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = false;
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
}
