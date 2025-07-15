{pkgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.helix&release=master
  programs.helix = {
    defaultEditor = true;
    enable = true;
    extraPackages = with pkgs; [
      alejandra
      bash-language-server
      biome
      docker-compose-language-service
      dockerfile-language-server-nodejs
      graphql-language-service-cli
      lldb
      markdown-oxide
      nixd
      rust-analyzer-unwrapped
      typescript-language-server
      vscode-langservers-extracted
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
      theme = "catppuccin_mocha";
    };
  };
}
