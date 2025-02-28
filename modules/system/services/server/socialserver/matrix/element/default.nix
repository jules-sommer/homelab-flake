{ config, lib, ... }:
{
  imports = [ ./nginx ];

  config = lib.mkIf config.services.matrix-synapse.enable {
    nixpkgs.config.element-web.conf = {
      default_server_config."m.homeserver" = {
        base_url = "https://matrix.jimbosfiles.com";
        server_name = "matrix.jimbosfiles.com";
      };
      branding = {
        #welcome_background_url = "https://staging.jimbosfiles.com/images/backgrounds/template-background.png";
        #auth_header_logo_url = "https://staging.jimbosfiles.com/images/logos/template-logo.png";
      };
      embedded_pages = {
        home_url = "https://www.jimbosfiles.com/";
      };
      disable_custom_urls = true;
      disable_guests = true;
      default_theme = "dark";
    };
  };
}
