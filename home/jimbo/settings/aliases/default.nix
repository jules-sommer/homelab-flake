{ pkgs, ... }:
{
  home.shellAliases = {
    # NixOS
    flakedate = "doas nix flake update --flake /etc/nixos";
    nhs = "doas nh os switch -R /etc/nixos";

    nixclean = "nix store gc; nix store optimise";
    nixpurge = "doas nix-collect-garbage --delete-old";
    nixscrub = "nixclean; nixpurge";

    # Shortcuts
    ff = "clear && fastfetch";
    ip = "ip -c";
    cat = "${pkgs.bat}/bin/bat --paging never";
    myip = "curl ifconfig.co";
  };
}
