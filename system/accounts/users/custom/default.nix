{ home-manager, ... }:
{
  imports = [
    ./jules
    ./jimbo

    home-manager.nixosModules.home-manager
  ];
}
