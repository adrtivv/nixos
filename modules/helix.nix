{lib, ...}: {
  flake.modules.homeManager.helix = {
    config,
    pkgs,
    ...
  }: {
    # https://nix.catppuccin.com/options/main/home/catppuccin.helix/
    catppuccin.helix = lib.mkIf config.catppuccin.enable {
      # https://nix.catppuccin.com/options/main/home/catppuccin.helix/#catppuccin-helix.useItalics
      useItalics = true;
    };

    # https://home-manager-options.extranix.com/?query=programs.helix&release=master
    # https://helix-editor.com/
    programs.helix = {
      defaultEditor = true;

      enable = true;

      extraPackages = with pkgs; [
        alejandra

        bash-language-server

        biome

        docker-compose-language-service

        dockerfile-language-server

        graphql-language-service-cli

        # https://search.nixos.org/packages?channel=unstable&show=file&query=kdlfmt
        # https://github.com/hougesen/kdlfmt
        kdlfmt

        lldb

        markdown-oxide

        nixd

        rust-analyzer-unwrapped

        simple-completion-language-server

        # typescript-language-server

        vscode-langservers-extracted

        vtsls

        yaml-language-server
      ];

      languages = {
        language = [
          {
            auto-format = true;

            language-servers = [
              {
                except-features = ["format"];

                name = "vscode-css-language-server";
              }

              "biome"

              "scls"
            ];

            name = "css";
          }

          {
            auto-format = true;

            language-servers = ["graphql-language-service" "biome"];

            name = "graphql";
          }

          {
            auto-format = true;

            language-servers = [
              {
                except-features = ["format"];

                name = "typescript-language-server";
              }

              "biome"

              "scls"
            ];

            name = "javascript";
          }

          {
            auto-format = true;

            language-servers = [
              {
                except-features = ["format"];

                name = "vscode-json-language-server";
              }

              "biome"

              "scls"
            ];

            name = "json";
          }

          {
            auto-format = true;

            language-servers = [
              {
                except-features = ["format"];

                name = "vscode-json-language-server";
              }

              "biome"

              "scls"
            ];

            name = "jsonc";
          }

          {
            auto-format = true;

            language-servers = [
              {
                except-features = ["format"];

                name = "typescript-language-server";
              }

              "biome"

              "scls"
            ];

            name = "jsx";
          }

          {
            auto-format = true;

            # formatter = { command = "alejandra" ;};

            language-servers = ["nixd"];

            name = "nix";
          }

          {
            auto-format = true;

            language-servers = ["rust-analyzer"];

            name = "rust";
          }

          {
            auto-format = true;

            language-servers = [
              {
                except-features = ["format"];

                name = "typescript-language-server";
              }

              "biome"

              "scls"
            ];

            name = "tsx";
          }

          {
            auto-format = true;

            language-servers = [
              {
                except-features = ["format"];

                name = "typescript-language-server";
              }

              "biome"

              "scls"
            ];

            name = "typescript";
          }
        ];

        language-server = {
          biome = {
            args = ["lsp-proxy"];

            command = "biome";
          };

          nixd = {
            args = ["--config={\"formatting\":{\"command\":[\"alejandra\"]}}" "--inlay-hints=true"];

            command = "nixd";
          };

          scls = {
            command = "simple-completion-language-server";

            config = {
              feature_snippets = false;

              feature_words = true;

              snippets_first = false;

              snippets_inline_by_word_tail = false;

              feature_unicode_input = false;

              feature_paths = false;

              feature_citations = false;
            };

            environment = {
              LOG_FILE = "/tmp/completion.log";

              RUST_LOG = "info,simple-completion-language-server=info";
            };
          };

          typescript-language-server = {
            args = ["--stdio"];

            command = "vtsls";

            config = {
              hostInfo = "helix";

              typescript = {
                autoUseWorkspaceTsdk = true;

                suggest.completeFunctionCalls = true;

                updateImportsOnFileMove.enable = "always";

                updateImportsOnFileSave.enabled = "always";
              };
            };
          };
        };
      };

      settings = {
        editor = {
          # Show currently open buffers, only when more than one exists.
          bufferline = "multiple";

          color-modes = true;

          # Highlight all lines with a cursor
          cursorline = true;

          cursor-shape = {
            insert = "bar";

            normal = "block";

            select = "underline";
          };

          end-of-line-diagnostics = "hint";

          file-picker.hidden = false;

          indent-guides.render = true;

          inline-diagnostics = {
            # Show inline diagnostics when the cursor is on the line
            cursor-line = "warning";

            # Don't expand diagnostics unless the cursor is on the line
            other-lines = "disable";
          };

          # Use relative line numbers
          line-number = "relative";

          lsp = {
            # Disable automatically popups of signature parameter help
            auto-signature-help = false;

            display-inlay-hints = false;

            # Show LSP messages in the status line
            display-messages = true;
          };

          mouse = false;

          soft-wrap.enable = true;

          # Add the git branch to the status line.
          statusline.left = ["mode" "spinner" "version-control" "file-name"];
        };

        # theme = "catppuccin_mocha";
      };
    };
  };
}
