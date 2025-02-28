{ impermanence, ... }:
{
  imports = [
    ./main
    ./root
    impermanence.nixosModules.impermanence
  ];
}
