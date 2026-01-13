{ ... }:
{
  flake.modules.homeManager.obs_studio =
    { pkgs, ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.obs-studio&release=master
      # https://obsproject.com/kb/
      programs.obs-studio = {
        enable = true;

        plugins = with pkgs; [
          obs-studio-plugins.wlrobs
        ];
      };
    };
}
