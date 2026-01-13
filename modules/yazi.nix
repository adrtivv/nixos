{ ... }:
{
  flake.modules.homeManager.yazi =
    { pkgs, ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.yazi&release=master
      # https://yazi-rs.github.io/
      programs.yazi = {
        enable = true;

        enableBashIntegration = true;

        extraPackages = with pkgs; [
          fd

          fzf

          ffmpeg_8-full

          jq

          imagemagick

          p7zip

          poppler

          resvg

          ripgrep

          wl-clipboard

          zoxide
        ];

        keymap = {
          mgr.prepend_keymap = [
            {
              on = "M";

              run = "plugin mount";
            }

            {
              desc = "Show or hide the preview pane";

              on = "T";

              run = "plugin toggle-pane min-preview";
            }

            {
              desc = "Maximize or restore the preview pane";

              on = "T";

              run = "plugin toggle-pane max-preview";
            }

            {
              on = [
                "g"
                "c"
              ];

              run = "plugin vcs-files";

              desc = "Show Git file changes";
            }
          ];
        };

        plugins = {
          mount = pkgs.yaziPlugins.mount;

          toggle-pane = pkgs.yaziPlugins.toggle-pane;

          vcs-files = pkgs.yaziPlugins.vcs-files;
        };

        # settings = {};
      };
    };
}
