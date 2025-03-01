{ ... }:
{
  imports = [
    ./extlinux
    ./root-reset
  ];

  boot.initrd = {
    systemd.enable = true;
    kernelModules = [ 
      "ahci"
      "dm-snapshot"
      "mmc_core"
      "pcie_rockchip_host"
      "phy_rockchip_pcie"
      "rockchip_dfi"
      "rockchip_thermal"
      "rtc_rk808"
      "rockchip_saradc"
      "uas"
      "fusb302"
    ];
  };
}
