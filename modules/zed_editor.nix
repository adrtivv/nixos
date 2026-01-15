{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
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
          markdown-oxide

          # nil

          # nixd

          nixfmt

          package-version-server
        ];

        enable = true;

        # package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.zed-editor;

        # For information on how to configure Zed, see the Zed documentation: https://zed.dev/docs/configuring-zed. To see all of Zed's default settings without changing your custom settings, run `zed: open default settings` from the command palette (cmd-shift-p / ctrl-shift-p).
        userSettings = {
          helix_mode = true;

          languages = {
            Nix = {
              format_on_save = "on";

              formatter = {
                external = {
                  command = lib.getExe pkgs.nixfmt;
                };
              };

              # language_servers = [
              # "nil"

              # "nixd"

              # "..."
              # ];
            };
          };

          lsp = {
            biome = {
              # https://github.com/biomejs/biome-zed/blob/main/CONTRIBUTING.md#custom-biome-binary
              binary = {
                arguments = [ "lsp-proxy" ];

                path = lib.getExe pkgs.biome;
              };
            };

            # nil = {
            #   binary = {
            #     path = lib.getExe pkgs.nil;
            #   };
            # };

            # nixd = {
            #   binary = {
            #     path = lib.getExe pkgs.nixd;
            #   };
            # };
          };

          project_panel = {
            dock = "right";
          };

          relative_line_numbers = true;

          soft_wrap = "editor_width";

          ui_font_size = 16;
        };
      };
    };
}
