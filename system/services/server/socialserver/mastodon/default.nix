{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.system.socialserver.enable {
    services.mastodon = {
      enable = true;
      localDomain = "social.nixfox.ca";
      streamingProcesses = 4;
      configureNginx = true;
      smtp = {
        createLocally = false;
        host = "mx.nixfox.ca";
        port = 587;
        authenticate = true;
        fromAddress = "NixFox Mastodon <noreply@nixfox.ca>";
        user = "noreply@nixfox.ca";
        passwordFile = pkgs.writeText "smtp_pass.txt" config.secrets.noreplyPassword;
      };
    };
    environment.persistence."/persist".directories = [
      "/var/lib/mastodon"
    ];
  };
}
