{ config, lib, pkgs, ... }:
{
  imports = [ ./nginx ];

  config = lib.mkIf config.system.server.enable {
    services.forgejo = {
      enable = true;
      package = pkgs.forgejo;
      settings = {
        server = {
          DOMAIN = "git.nixfox.ca";
          ROOT_URL = "https://git.nixfox.ca:443";
          HTTP_PORT = 3110;
          SSH_PORT = 2299;
          START_SSH_SERVER = true;
        };
        mailer = {
          ENABLED = true;
          SMTP_ADDR = "mx.nixfox.ca";
          FROM = "NixFox Git <noreply@nixfox.ca>";
          USER = "noreply@nixfox.ca";
          PASSWD = config.secrets.noreplyPassword;
          PROTOCOL = "smtps";
        };
        service = {
          REGISTER_EMAIL_CONFIRM = true;
          DISABLE_REGISTRATION = true;
        };
        ui.DEFAULT_THEME = "forgejo-dark";
      };
    };

    networking.firewall.allowedTCPPorts = [ 2299 ];

    services.cloudflare-dyndns.domains = [ "git.nixfox.ca" ];

    environment.persistence."/persist".directories = [ "/var/lib/forgejo" ];
  };
}
