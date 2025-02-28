{ lib, ... }: 
{
  options.system.webserver.enable = lib.mkEnableOption "Enable nginx related services";

  imports = [
    ./acme
    ./nginx
  ];
}
