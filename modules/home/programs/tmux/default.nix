{ ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    terminal = "st-256color";
    historyLimit = 4096;
    baseIndex = 1;
    extraConfig = ''
      set -g status on
      set -g status-left ""
      set -g status-position bottom
      set -g status-right "#[bg=brightblack]#[fg=dark_purple] #T "
      set -g status-style "bg=black"

      set -g set-titles on
      set -g set-titles-string "#T"

      setw -g window-status-format "#[bg=brightmagenta]#[fg=black] #I #[bg=brightblack]#[fg=white] #W "
      setw -g window-status-current-format "#[bg=brightmagenta]#[fg=black] #I #[bg=white]#[fg=black] #W "
    '';
  };
}
