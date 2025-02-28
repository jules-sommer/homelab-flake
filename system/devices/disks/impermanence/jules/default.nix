{ ... }:
{
  environment.persistence."/persist" = {
    hideMounts = true;
    users.jules = {
      directories = [
        "Keepers"
        "Documents"
        "Pictures"
        "Videos"
        "VMs"

        ".snapshots"
        ".cache/nix-index"

        { directory = ".ssh"; mode = "0700"; }
        { directory = ".gnupg"; mode = "0700"; }
      ];
      files = [
        ".zsh_history"
        ".local/state/lazygit/state.yml"
      ];
    };
  };
}
