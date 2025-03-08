{ impermanence, ... }:
{
  imports = [
    ./jules
    ./root

    impermanence.nixosModules.impermanence
  ];
}
