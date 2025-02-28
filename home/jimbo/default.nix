{ lib, ... }:
{
  imports = [
    ./programs
    ./settings
    ./user
  ];

  config.home.stateVersion = "24.11";
}
