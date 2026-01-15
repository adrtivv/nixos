{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.fastfetch&release=master
      # https://github.com/fastfetch-cli/fastfetch
      programs.fastfetch = {
        enable = true;
      };
    };
}
