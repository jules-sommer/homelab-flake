{ config, lib, ... }:
{
  services.nginx.virtualHosts."jimbosfiles.com" = lib.mkIf config.system.server.enable {
    enableACME = true;
    addSSL = true;
    globalRedirect = "www.nixfox.ca";
    locations = {
      "/.well-known/matrix/client".extraConfig = ''
        default_type application/json;
        return 200 '
          {
            "m.homeserver": {
              "base_url": "https://matrix.jimbosfiles.com"
            },
            "m.identity_server": {
              "base_url": "https://matrix.org"
            }
          }
        ';
      '';
      "/.well-known/matrix/server".extraConfig = ''
        default_type application/json;
        return 200 '{ "m.server": "matrix.jimbosfiles.com:443" }';
      '';
    };
  };
}
