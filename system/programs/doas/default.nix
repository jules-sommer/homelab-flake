{ pkgs, ... }:
{
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        { # Give wheel root access
          groups = [ "wheel" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };

  environment.systemPackages = with pkgs; [ doas-sudo-shim ];
}
