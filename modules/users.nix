{ config, ... }:
{
  flake.modules.homeManager =
    let
      common =
        { pkgs, ... }:
        {
          home = {
            packages = with pkgs; [
              # https://search.nixos.org/packages?channel=unstable&show=ffmpeg_8-full&query=ffmpeg_8-full
              # https://www.ffmpeg.org/
              ffmpeg_8-full

              # https://search.nixos.org/packages?channel=unstable&show=file&query=file
              # https://darwinsys.com/file/
              file

              # https://search.nixos.org/packages?channel=unstable&show=killall&query=killall
              killall

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
          };

          imports = [
            config.flake.modules.homeManager.atuin

            # config.flake.modules.homeManager.bash

            config.flake.modules.homeManager.bat

            config.flake.modules.homeManager.bottom

            config.flake.modules.homeManager.brave_browser

            config.flake.modules.homeManager.catppuccin

            config.flake.modules.homeManager.dank_material_shell

            config.flake.modules.homeManager.dank_material_shell_niri

            config.flake.modules.homeManager.direnv

            config.flake.modules.homeManager.easy_effects

            config.flake.modules.homeManager.eza

            config.flake.modules.homeManager.fast_fetch

            config.flake.modules.homeManager.fd

            config.flake.modules.homeManager.fonts

            # config.flake.modules.homeManager.kde_plasma_manager

            config.flake.modules.homeManager.ghostty

            config.flake.modules.homeManager.helix

            config.flake.modules.homeManager.home_manager

            config.flake.modules.homeManager.mpv

            config.flake.modules.homeManager.nh

            config.flake.modules.homeManager.niri

            config.flake.modules.homeManager.nix_your_shell

            config.flake.modules.homeManager.obs_studio

            config.flake.modules.homeManager.ripgrep

            # config.flake.modules.homeManager.satty

            config.flake.modules.homeManager.sops

            config.flake.modules.homeManager.starship

            config.flake.modules.homeManager.yazi

            config.flake.modules.homeManager.zen_browser

            config.flake.modules.homeManager.zoxide

            config.flake.modules.homeManager.zsh
          ];

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
        };
    in
    {
      users__adrtivv =
        {
          lib,
          pkgs,
          ...
        }@args:
        let
          home_manager_config = args.config;
        in
        {
          # https://home-manager-options.extranix.com/?query=home&release=master
          home = {
            homeDirectory = "/home/adrtivv";

            packages = [
              # https://search.nixos.org/packages?channel=unstable&show=obsidian&query=obsidian
              # https://obsidian.md/
              pkgs.obsidian
            ];

            username = "adrtivv";
          };

          imports = [
            common

            config.flake.modules.homeManager.gaming

            config.flake.modules.homeManager.gh

            config.flake.modules.homeManager.git

            config.flake.modules.homeManager.gitui

            config.flake.modules.homeManager.jujutsu

            # config.flake.modules.homeManager.podman

            config.flake.modules.homeManager.zed_editor
          ];

          programs = {
            git.settings.user = lib.mkIf home_manager_config.programs.git.enable {
              email = "adrtivv@gmail.com";

              name = "adrtivv";
            };

            jujutsu.settings.user = lib.mkIf home_manager_config.programs.jujutsu.enable {
              email = "adrtivv@gmail.com";

              name = "adrtivv";
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

      users__anon =
        args:
        let
          home_manager_config = args.config;
        in
        {
          # https://home-manager-options.extranix.com/?query=home&release=master
          home = {
            homeDirectory = "/home/anon";

            username = "anon";
          };

          imports = [
            common
          ];

          sops = {
            secrets = {
              "users/anon/id_ed25519" = {
                path = "${home_manager_config.home.homeDirectory}/.ssh/id_ed25519";
              };
            };
          };
        };
    };

  flake.modules.nixos =
    let
      common =
        { ... }:
        {
          imports = [
            # config.flake.modules.nixos.kde_plasma_manager

            config.flake.modules.nixos.sops

            config.flake.modules.nixos.zsh
          ];

          users = {
            # This is required for sops to set the user password during the system activation. It also forces the user's password to only be controllable through this nix configuration.
            mutableUsers = false;
          };
        };
    in
    {
      users__adrtivv =
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

          imports = [ common ];

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

      users__anon =
        args:
        let
          nixos_config = args.config;
        in
        {
          # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.users
          home-manager.users.anon = {
            imports = [
              config.flake.modules.homeManager.users__anon
            ];
          };

          imports = [ common ];

          sops = {
            # Attribute set of secrets that are to be decrypted and be made available at `/run/secrets`.
            secrets = {
              "users/anon/password_hash" = {
                # Normally sops-nix runs after the users are created on the system but this secret is required for user creation itself. This makes sops extract the decrypted secret to `/run/secrets-for-users` at system activation time.
                neededForUsers = true;
              };
            };
          };

          users = {
            # Define a user account. Don't forget to set a password with ‘passwd’.
            users.anon = {
              extraGroups = [
                "networkmanager"

                "wheel"
              ];

              hashedPasswordFile = nixos_config.sops.secrets."users/anon/password_hash".path;

              isNormalUser = true;

              openssh.authorizedKeys.keys = [
                (builtins.readFile ./users/anon/id_ed25519.pub)
              ];
            };
          };
        };
    };
}
