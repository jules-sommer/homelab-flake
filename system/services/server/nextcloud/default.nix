{ config, pkgs, ... }:
{
  imports = [ ./nginx ];

  services.nextcloud = {
    enable = config.system.server.enable;
    package = pkgs.nextcloud30;
    hostName = "cloud.example.com";
    https = true;
    config = {
      adminuser = config.sysusers.main;
      adminpassFile = "${pkgs.writeText "initial" config.secrets.initialPass}";
    };
    settings = {
      trusted_proxies = [ "127.0.0.1" ];
      trusted_domains = [ "cloud.example.com" ];
      overwriteprotocol = "https";
      mail_smtphost = "mx.example.com";
      mail_domain = "example.com";
      mail_from_address = "noreply";
      mail_smtpauth = "true";
      mail_smtpname = "noreply@example.com";
      mail_smtppassword = config.secrets.noreplyPassword;
      mail_smtpmode = "smtp";
      mail_smtpport = 587;
    };
  };
}
