{ config, lib, ... }:
{
  options.secrets = lib.mkOption {
    type = lib.types.attrs;
  };

  config.secrets = {
    # User passwords, generated with 'mkpasswd -m sha-512'
    mainAccPass = "$6$gYpE.pG/zPXgin06$2kydjDfd0K62Dhf9P0PFvJhRNz6xIC/bHYaf/XYqyKcLyZNzPQpy8uy9tCRcSYlj1wwBhzVtTRyItwajOHCEj0";

    # Initial password for apps that ask for it
    initialPass = "changeme";

    # Cloudflare API key
    flareApiKey = "CLOUDFLARE_API_TOKEN=changeme";

    # Matrix secrets
    matrixSecret = "changeme";
    coturnSecret = "changeme";

    # Transmission credentials, plaintext
    transmissionCredFile = ''
      {
        "rpc-username": "jimbo",
        "rpc-password": "changeme"
      }
    '';
  };
}
