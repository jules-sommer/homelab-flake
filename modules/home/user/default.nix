{ config, ... }:
{
  home = {
    username = "jimbo";
    homeDirectory = "/home/${config.home.username}";
    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
      LIBVIRT_DEFAULT_URI = "qemu:///system";
      HISTCONTROL = "ignoreboth";
      NIXPKGS_ALLOW_UNFREE = 1;
    };
  };
}
