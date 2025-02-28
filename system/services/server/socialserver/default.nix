{ lib, ... }:
{
  options.system.socialserver.enable = lib.mkEnableOption "Enable social media like services";

  imports = [
    ./mastodon
    ./matrix
    ./owncast
  ];
}
