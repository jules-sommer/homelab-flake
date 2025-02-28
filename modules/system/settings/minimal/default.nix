{ ... }:
{
  environment = {
    defaultPackages = [ ];
    stub-ld.enable = false;
  };

  documentation = {
    doc.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  programs = {
    nano.enable = false;
    less.lessopen = null;
    command-not-found.enable = false;
  };

  services.logrotate.enable = false;
}
