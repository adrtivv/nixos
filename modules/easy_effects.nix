{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.easyeffects ];

      # https://home-manager-options.extranix.com/?query=services.easyeffects&release=master
      # https://github.com/wwmm/easyeffects
      services.easyeffects = {
        enable = false;
      };
    };
}
