{pkgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.zed-editor&release=master
  programs.zed-editor = {
    extensions = ["basher" "biome" "catppuccin" "catppuccin-icons" "docker-compose" "dockerfile" "markdown-oxide" "nix"];
    extraPackages = with pkgs; [
      alejandra
      nixd
    ];
    enable = true;
    userKeymaps = {};
    # For information on how to configure Zed, see the Zed documentation: https://zed.dev/docs/configuring-zed
    # To see all of Zed's default settings without changing your custom settings, run `zed: open default settings` from the command palette (cmd-shift-p / ctrl-shift-p).
    userSettings = {
      buffer_font_size = 16;
      icon_theme = {
        dark = "Catppuccin Mocha";
        light = "Catppuccin Latte";
        mode = "system";
      };
      languages = {
        Nix = {
          format_on_save = "on";
          formatter = {
            external = {
              command = "alejandra";
            };
          };
          language_servers = ["nixd" "..."];
        };
      };
      relative_line_numbers = true;
      soft_wrap = "editor_width";
      theme = {
        dark = "Catppuccin Mocha";
        light = "Catppuccin Latte";
        mode = "system";
      };
      ui_font_size = 16;
      vim_mode = true;
    };
  };
}
