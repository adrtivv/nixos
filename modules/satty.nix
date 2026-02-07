{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.satty&release=master
      # https://github.com/Satty-org/Satty
      programs.satty = {
        enable = true;

        # # https://github.com/Satty-org/Satty?tab=readme-ov-file#configuration-file
        # settings = {};
      };
    };
}
