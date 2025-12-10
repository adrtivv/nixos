{...}: {
  flake.modules.homeManager.yazi = {pkgs, ...}: {
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

      # keymap = {};

      # settings = {};
    };
  };
}
