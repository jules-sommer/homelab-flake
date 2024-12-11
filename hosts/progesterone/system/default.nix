{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware
  ];

  config = {
    networking = {
      hostName = "progesterone";
      # Pick only one of the below networking options.
      wireless.enable = true;
      firewall = {
        enable = true;
        allowedTCPPorts = [ ];
        allowedUDPPorts = [ ];
      };
    };

    time.timeZone = "America/Toronto";

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = lib.mkDefault "us";
      useXkbConfig = true; # use xkb.options in tty.
    };

    services = {
      xserver = {
        enable = true;
        xkb.layout = "us";
        xkb.options = "eurosign:e,caps:escape";
      };

      printing.enable = true;

      openssh = {
        enable = true;
        openFirewall = true;
      };
    };

    # Enable sound.
    services.pipewire = {
      enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    users.users.jules = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh = {
        authorizedKeys = {

        };
      };
      packages = with pkgs; [
        tree
      ];
    };

    environment.systemPackages = with pkgs; [
      vim
      neovim
      wget
    ];
    programs = {
      mtr.enable = true;
      localsend = {
        enable = true;
        openFirewall = true;
      };
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    system = {
      stateVersion = "23.11";
    };
  };
}
