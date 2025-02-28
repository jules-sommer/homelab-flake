{ config, lib, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.kernelModules = [ "ahci" "dm-snapshot" "mmc_core" "pcie_rockchip_host" "phy_rockchip_pcie" "rockchip_dfi" "rockchip_thermal" "rtc_rk808" "rockchip_saradc" "uas" "fusb302" ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
