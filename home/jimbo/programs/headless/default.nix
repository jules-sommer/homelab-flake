{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    dua
    p7zip
    vimv
  ];
}
