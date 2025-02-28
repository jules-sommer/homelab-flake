{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Jimbo";
    userEmail = "jimbo@nixfox.ca";
  };
  
  programs.lazygit.enable = true;

  home.packages = with pkgs; [
    gnupg
    git-crypt
  ];
}
