{ config, lib, ... }:
{
  imports = [ ./nginx ];

  config = lib.mkIf config.system.server.enable {
    services.vaultwarden = {
      enable = true;
      config = {
        DOMAIN = "https://pass.nixfox.ca";
        SIGNUPS_ALLOWED = false;
        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8222;
        ROCKET_LOG = "critical";

        # Smtp email
        SMTP_HOST = "mx.nixfox.ca";
        SMTP_FROM = "noreply@nixfox.ca";
        SMTP_FROM_NAME = "Vaultwarden";
        SMTP_USERNAME = "noreply@nixfox.ca";
        SMTP_PASSWORD = config.secrets.noreplyPassword;
        SMTP_SECURITY = "starttls";
        SMTP_PORT = 587;
        SMTP_TIMEOUT = 15;
      };
    };

    environment.persistence."/persist".directories = [ "/var/lib/bitwarden_rs" ];
  };
}
