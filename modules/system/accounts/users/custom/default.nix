{ home-manager, ... }:
{
  imports = [
    ./main
    home-manager.nixosModules.home-manager
  ];
}
