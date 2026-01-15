{ config, ... }:
{
  flake.modules.homeManager.users__adrtivv =
    {
      lib,
      pkgs,
      ...
    }@args:
    let
      home_manager_config = args.config;
    in
    {
      home = {
        homeDirectory = "/home/adrtivv";

        packages = with pkgs; [
          # https://search.nixos.org/packages?channel=unstable&show=ffmpeg_8-full&query=ffmpeg_8-full
          # https://www.ffmpeg.org/
          ffmpeg_8-full

          # https://search.nixos.org/packages?channel=unstable&show=file&query=file
          # https://darwinsys.com/file/
          file

          # https://search.nixos.org/packages?channel=unstable&show=killall&query=killall
          killall

          # https://search.nixos.org/packages?channel=unstable&show=obsidian&query=obsidian
          # https://obsidian.md/
          obsidian

          # https://search.nixos.org/packages?channel=unstable&show=qbittorrent&query=qbittorrent
          # https://github.com/qbittorrent/qBittorrent
          qbittorrent

          # https://search.nixos.org/packages?channel=unstable&show=readest&query=readest
          # https://github.com/readest/readest
          readest

          # https://search.nixos.org/packages?channel=unstable&show=telegram-desktop&query=telegram-desktop
          # https://desktop.telegram.org/
          telegram-desktop

          # https://search.nixos.org/packages?channel=unstable&show=tokei&query=tokei
          # https://github.com/XAMPPRocky/tokei
          tokei

          # https://search.nixos.org/packages?channel=unstable&show=unrar&query=unrar
          # https://www.rarlab.com/
          unrar

          # https://search.nixos.org/packages?channel=unstable&show=vlc&query=vlc
          # https://www.videolan.org/vlc/
          vlc

          # https://search.nixos.org/packages?channel=unstable&show=ytarchive&query=ytarchive
          # https://github.com/Kethsar/ytarchive
          ytarchive
        ];

        preferXdgDirectories = true;

        shell.enableZshIntegration = true;

        # This value determines the home Manager release that your configuration is compatible with. This helps avoid breakage when a new home Manager release introduces backwards incompatible changes. You can update home Manager without changing this value. See the home Manager release notes for a list of state version changes in each release.
        stateVersion = "25.05";

        username = "adrtivv";
      };

      programs = {
        # # https://home-manager-options.extranix.com/?query=programs.firefox&release=master
        # # http://www.mozilla.com/en-US/firefox/
        # firefox = {
        #   enable = true;

        #   nativeMessagingHosts = [pkgs.vdhcoapp];
        # };

        # # https://home-manager-options.extranix.com/?query=programs.foliate&release=master
        # # https://johnfactotum.github.io/foliate
        # foliate = {
        #   enable = true;
        # };

        # https://home-manager-options.extranix.com/?query=programs.tealdeer&release=master
        # https://github.com/dbrgn/tealdeer
        tealdeer = {
          enable = true;

          settings.updates.auto_update = true;
        };
      };

      sops = {
        secrets = {
          "users/adrtivv/id_ed25519" = {
            path = "${home_manager_config.home.homeDirectory}/.ssh/id_ed25519";
          };
        };
      };
    };

  flake.modules.nixos.hosts__laptop =
    args:
    let
      nixos_config = args.config;
    in
    {
      # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.users
      home-manager.users.adrtivv = {
        imports = [
          config.flake.modules.homeManager.users__adrtivv
        ];
      };

      sops = {
        # Attribute set of secrets that are to be decrypted and be made available at `/run/secrets`.
        secrets = {
          "users/adrtivv/password_hash" = {
            # Normally sops-nix runs after the users are created on the system but this secret is required for user creation itself. This makes sops extract the decrypted secret to `/run/secrets-for-users` at system activation time.
            neededForUsers = true;
          };
        };
      };

      users = {
        # This is required for sops to set the user password during the system activation. It also forces the user's password to only be controllable through this nix configuration.
        mutableUsers = false;

        # Define a user account. Don't forget to set a password with ‘passwd’.
        users.adrtivv = {
          extraGroups = [
            # "docker"

            "networkmanager"

            "wheel"
          ];

          hashedPasswordFile = nixos_config.sops.secrets."users/adrtivv/password_hash".path;

          isNormalUser = true;

          openssh.authorizedKeys.keys = [
            (builtins.readFile ./users/adrtivv/id_ed25519.pub)
          ];
        };
      };
    };
}
