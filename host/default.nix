{ ... }:
{
  imports = [
    ./disko
    ./hardware
    ../modules/system
  ];

  networking = {
    hostName = "rubble";
    hostId = "e0b1fcef";
  };

  system = {
    extlinux.enable = true;
    wireless.enable = true;
    stateVersion = "24.11";
  };
}
