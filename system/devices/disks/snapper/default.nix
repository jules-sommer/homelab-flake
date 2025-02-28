{ ... }:
{
  imports = [
    ./jules
    ./jimbo
    ./root
  ];

  services.snapper = {
    snapshotInterval = "0/6:00:00";
    persistentTimer = true;
  };
}
