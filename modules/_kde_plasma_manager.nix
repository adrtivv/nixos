{ inputs, ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      # https://nix-community.github.io/plasma-manager/options.xhtml
      # https://develop.kde.org/docs/
      programs.plasma = {
        configFile.kdeglobals.General = {
          TerminalApplication = "ghostty";

          TerminalService = "com.mitchellh.ghostty.desktop";
        };

        desktop = {
          icons = {
            alignment = "left";

            arrangement = "topToBottom";

            sorting = {
              foldersFirst = false;

              mode = "name";
            };
          };
        };

        enable = true;

        panels = [
          {
            alignment = "center";

            floating = false;

            hiding = "autohide";

            lengthMode = "fill";

            opacity = "adaptive";
          }
        ];
      };
    };

  flake.modules.nixos.hosts__laptop =
    { ... }:
    {
      home-manager = {
        # https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.sharedModules
        sharedModules = [
          inputs.plasma_manager.homeModules.plasma-manager
        ];
      };
    };
}
