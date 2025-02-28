{ config, ... }:
{
  environment.persistence."/persist" = {
    hideMounts = true;
    users.${config.sysusers.main} = {
      directories = [
        "Keepers"
        "Documents"
        "Pictures"
        "Videos"
        "Games"
        "VMs"

        ".snapshots"
        ".mozilla"
        ".thunderbird"

        ".config/blender"
        ".config/dconf"
        ".config/vesktop"
        ".config/sunshine"
        ".config/heroic"
        ".config/obs-studio"

        ".local/share/mpd"
        ".local/share/nvim/undo"
        ".local/share/PrismLauncher"
        ".local/share/Steam"
        ".local/share/TelegramDesktop"

        ".local/state/wireplumber"

        ".cache/nix-index"

        { directory = ".ssh"; mode = "0700"; }
        { directory = ".gnupg"; mode = "0700"; }
        { directory = ".local/share/keyrings"; mode = "0700"; }
      ];
      files = [
        ".zsh_history"
        ".local/state/lazygit/state.yml"
        ".local/share/applications" # Create directory so nothing generates inside of it
      ];
    };
  };
}
