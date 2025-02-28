{ impermanence, ... }:
{
  imports = [
    ./jules
    ./jimbo
    ./root

    impermanence.nixosModules.impermanence
  ];
}
