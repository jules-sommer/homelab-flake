{ config, lib, ... }:
{
  imports = [ ./nginx ];

  config = lib.mkIf config.services.matrix-synapse.enable {
    services = {
      coturn = {
        enable = true;
        no-cli = true;
        no-tcp-relay = true;
        min-port = 49000;
        max-port = 50000;
        use-auth-secret = true;
        static-auth-secret = config.secrets.coturnSecret;
        realm = "turn.jimbosfiles.com";
        cert = "/var/lib/acme/turn.jimbosfiles.com/fullchain.pem";
        pkey = "/var/lib/acme/turn.jimbosfiles.com/key.pem";
      };

      # Enable coturn on Synapse
      matrix-synapse.settings = {
        turn_uris = [
          "turn:turn.jimbosfiles.com:3478?transport=udp"
          "turn:turn.jimbosfiles.com:3478?transport=tcp"
        ];
        turn_shared_secret = config.secrets.coturnSecret;
        turn_user_lifetime = "1h";
      };

      # Sync the IP to Cloudflare
      cloudflare-dyndns.domains = [ "turn.jimbosfiles.com" ];
    };

    # Open coturn ports
    networking.firewall = {
      allowedUDPPorts = [
        3478
        5349
      ];
      allowedUDPPortRanges = [{
        from = config.services.coturn.min-port;
        to = config.services.coturn.max-port;
      }];
    };
  };
}
