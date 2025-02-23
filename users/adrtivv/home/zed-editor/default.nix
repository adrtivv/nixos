{pkgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.zed-editor&release=master
  programs.zed-editor = {
    extensions = [
      "basher"
      # # Doesn't work on nixos because it requires FHS compliance.
      # "biome"
      "catppuccin"
      "catppuccin-icons"
      "docker-compose"
      "dockerfile"
      # # Doesn't work on nixos because it requires FHS compliance.
      # "markdown-oxide"
      "nix"
    ];
    extraPackages = with pkgs; [
      alejandra
      # Zed's "nix" extension doesn't install nixd itself. Instead, it expects it to be present in the $PATH(or $NIX_PATH on nixos) of the current user.
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
          language_servers = ["nixd" "!nil" "..."];
        };
      };
      project_panel = {
        "dock" = "right";
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
