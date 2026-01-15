{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=ripgrep&release=master
      # https://github.com/BurntSushi/ripgrep
      programs.ripgrep = {
        enable = true;
      };
    };
}
