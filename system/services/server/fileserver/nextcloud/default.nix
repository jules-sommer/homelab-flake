{ config, lib, pkgs, ... }:
{
  imports = [
    ./collabora
    ./nginx
  ];

  config = lib.mkIf config.system.fileserver.enable {
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud30;
      hostName = "cloud.nixfox.ca";
      https = true;
      config = {
        adminuser = config.sysusers.main;
        adminpassFile = "${pkgs.writeText "initial" config.secrets.initialPass}";
      };
      settings = {
        trusted_proxies = [ "127.0.0.1" ];
        trusted_domains = [ "cloud.nixfox.ca" ];
        overwriteprotocol = "https";
        mail_smtphost = "mx.nixfox.ca";
        mail_domain = "nixfox.ca";
        mail_from_address = "noreply";
        mail_smtpauth = "true";
        mail_smtpname = "noreply@nixfox.ca";
        mail_smtppassword = config.secrets.noreplyPassword;
        mail_smtpmode = "smtp";
        mail_smtpport = 587;
      };
    };
    environment.persistence."/persist".directories = [ "/var/lib/nextcloud" ];
  };
}
