{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.satty&release=master
      # https://github.com/Satty-org/Satty
      programs.satty = {
        enable = true;

        settings = {
          general = {
            fullscreen = true;
          };
        };
      };
    };
}
