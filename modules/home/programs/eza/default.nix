{ ... }:
{
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    colors = "always";
    extraOptions = [ "--group-directories-first" ];
  };
}
