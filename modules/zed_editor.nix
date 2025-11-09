{...}: {
  flake.modules.homeManager.zed_editor = {
    config,
    lib,
    pkgs,
    ...
  }: {
    # https://nix.catppuccin.com/options/main/home/catppuccin.zed/
    catppuccin.zed = lib.mkIf config.catppuccin.enable {
      # https://nix.catppuccin.com/options/main/home/catppuccin.zed/#catppuccin-zed.icons.enable
      icons.enable = true;

      # https://nix.catppuccin.com/options/main/home/catppuccin.zed/#catppuccin-zed.italics
      italics = true;
    };

    # https://home-manager-options.extranix.com/?query=programs.zed-editor&release=master
    # https://zed.dev/
    programs.zed-editor = {
      extensions = [
        "basher"

        "biome"

        "catppuccin"

        "catppuccin-icons"

        "docker-compose"

        "dockerfile"

        "git-firefly"

        "graphql"

        "markdown-oxide"

        "nix"

        "sql"
      ];

      extraPackages = with pkgs; [
        alejandra

        markdown-oxide

        package-version-server

        nixd
      ];

      enable = true;

      # package = specialArgs.inputs.nixpkgs_unstable.legacyPackages.${specialArgs.system}.zed-editor;

      # # Commented out because empty object results in jq parse error.
      # userKeymaps = {};

      # For information on how to configure Zed, see the Zed documentation: https://zed.dev/docs/configuring-zed. To see all of Zed's default settings without changing your custom settings, run `zed: open default settings` from the command palette (cmd-shift-p / ctrl-shift-p).
      userSettings = {
        helix_mode = true;

        # icon_theme = {
        # dark = "Catppuccin Mocha";

        # light = "Catppuccin Latte";

        # mode = "system";
        # };

        languages = {
          Nix = {
            format_on_save = "on";

            formatter = {
              external = {
                command = "alejandra";
              };
            };

            language_servers = ["nixd" "!nil" "..."];
          };
        };

        lsp = {
          biome = {
            # https://github.com/biomejs/biome-zed/blob/main/CONTRIBUTING.md#custom-biome-binary
            binary = {
              arguments = ["lsp-proxy"];

              path = lib.getExe pkgs.biome;
            };
          };
        };

        project_panel = {
          dock = "right";
        };

        relative_line_numbers = true;

        soft_wrap = "editor_width";

        # theme = {
        # dark = "Catppuccin Mocha";

        # light = "Catppuccin Latte";

        # mode = "system";
        # };

        ui_font_size = 16;
      };
    };
  };
}
