{ pkgs, ... }:
{
  home.packages = with pkgs; [ (pkgs.writeScriptBin "pfetch" "fastfetch --config ~/.config/fastfetch/small.jsonc") ];
  xdg.configFile."fastfetch/small.jsonc".source = ./small.jsonc;
}
