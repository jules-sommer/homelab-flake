{ config, lib, pkgs, ... }:
{
  imports = [
    ./nginx
  ];

  config = lib.mkIf config.system.socialserver.enable {
    services.matrix-synapse = {
      enable = true;
      settings = {
        server_name = "jimbosfiles.com";
        public_baseurl = "https://matrix.jimbosfiles.com";
        suppress_key_server_warning = true;

        listeners = [{
          port = 8008;
          bind_addresses = [
            "::"
            "0.0.0.0"
          ];
          resources = [{
            compress = true;
            names = [
              "client"
              "federation"
            ];
          }];
          type = "http";
          tls = false;
          x_forwarded = true;
        }];

        email = {
          notif_from = "NixFox Matrix <noreply@nixfox.ca>";
          smtp_host = "mx.nixfox.ca";
          smtp_user = "noreply@nixfox.ca";
          smtp_pass = config.secrets.noreplyPassword;
          enable_tls = true;
          smtp_port = 587;
          require_transport_security = true;
        };

        # Disable registration without email
        registrations_require_3pid = [ "email" ];

        # Set the type of database
        database.name = "sqlite3";

        # Allow account registration
        #enable_registration = true;

        # General settings
        url_preview_enabled = true;
        max_upload_size = "50M";
        report_stats = false;
        burst_count = 15;
      };
    };

    environment.persistence."/persist".directories = [ "/var/lib/matrix-synapse" ];
  };
}
