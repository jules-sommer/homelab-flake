{ config, ... }:
{
  imports = [ ./wireless ];

  networking = {
    wireless.enable = false;
    dhcpcd.enable = true;
    nftables.enable = true;
    firewall.allowPing = false;
    useNetworkd = true;
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = config.networking.nameservers;
    dnsovertls = "true";
  };
}
