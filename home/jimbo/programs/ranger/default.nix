{ config, ... }:
{
  programs.ranger = {
    enable = true;
    settings = {
      dirname_in_tabs = true;
      autosave_bookmarks = false;
      show_hidden = true;
      wrap_scroll = true;
      column_ratios = "2,2,4";
      hidden_filter = ''^\.|\.(?:pyc|pyo|bak|swp)$|^lost\+found$|^__(py)?cache__$'';
    };
    rifle = [
      # Media
      {
        condition = ''mime ^image, has imv, X, flag f'';
        command = ''imv -- "$@"'';
      }
      {
        condition = ''mime ^video, terminal, has mpv'';
        command = ''mpv -- "$@"'';
      }
      {
        condition = ''mime ^video, terminal, has mpv'';
        command = ''mpv --video-rotate=270 -- "$@"'';
      }
      {
        condition = ''mime ^audio|ogg$, terminal, has mpv'';
        command = ''mpv --no-audio-display -- "$@"'';
      }
      {
        condition = ''mime ^audio|ogg$, terminal, has mpv'';
        command = ''mpv --shuffle --no-audio-display -- "$@"'';
      }
      {
        condition = ''ext x?html?|pdf, has firefox, X, flag f'';
        command = ''firefox -- "$@"'';
      }
      {
        condition = ''ext pptx?|od[dfgpst]|docx?|sxc|xlsx?|xlt|xlw|gnm|gnumeric, has libreoffice, X, flag f'';
        command = ''libreoffice "$@"'';
      }

      # Scripts
      {
        condition = ''sh'';
        command = ''sh -- "$1"'';
      }
      {
        condition = ''py'';
        command = ''python -- "$1"'';
      }
      {
        condition = ''pl'';
        command = ''perl -- "$1"'';
      }
      {
        condition = ''js'';
        command = ''node -- "$1"'';
      }
      {
        condition = ''php'';
        command = ''php -- "$1"'';
      }

      # Misc
      {
        condition = ''ext exe|msi'';
        command = ''wine "$1"'';
      }
      {
        condition = ''ext 7z|ace|ar|arc|bz2?|cab|cpio|cpt|deb|dgc|dmg|gz|iso|jar|pkg|rar|shar|tar|tgz|xar|xpi|xz|zip|zst, has 7z'';
        command = ''7z x -- "$@"'';
      }
      {
        condition = ''label open, has xdg-open'';
        command = ''vim -- "$@"'';
      }
    ];
    plugins = [
      {
        name = "devicons2";
        src = builtins.fetchGit {
          url = "https://github.com/cdump/ranger-devicons2";
          rev = "94bdcc19218681debb252475fd9d11cfd274d9b1";
        };
      }
    ];
    extraConfig = "default_linemode devicons2";
  };

  # Ranger's bookmarks and necessary tools
  home = {
    file = {
      ".local/share/ranger/bookmarks".text = ''
        # Local files
        h:/home/${config.home.username}/
        k:/home/${config.home.username}/Keepers
        j:/home/${config.home.username}/Downloads
        v:/home/${config.home.username}/Videos
        c:/home/${config.home.username}/.config
        l:/home/${config.home.username}/.local
        d:/mnt
        n:/etc/nixos
      '';
    };
  };
}
