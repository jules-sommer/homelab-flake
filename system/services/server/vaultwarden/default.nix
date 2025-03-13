{ config, ... }:
{
  imports = [ ./nginx ];

  services.vaultwarden = {
    inherit (config.progesterone.vaultwarden) enable;
    config = {
      DOMAIN = "https://vault.dodrugsbe.gay";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";

      # Smtp email
      # SMTP_HOST = "mx.example.com";
      # SMTP_FROM = "noreply@example.com";
      # SMTP_FROM_NAME = "Vaultwarden";
      # SMTP_USERNAME = "noreply@example.com";
      # SMTP_PASSWORD = config.secrets.noreplyPassword;
      # SMTP_SECURITY = "starttls";
      # SMTP_PORT = 587;
      # SMTP_TIMEOUT = 15;
    };
  };
}
