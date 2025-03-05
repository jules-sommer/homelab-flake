{ lib, ... }: 
{
  imports = [
    ./acme
    ./nginx
  ];

  options.system.webserver.enable = lib.mkEnableOption "Enable nginx related services";
}
