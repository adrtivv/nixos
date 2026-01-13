{ ... }:
{
  flake.modules.homeManager.zoxide =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.zoxide&release=master
      # https://github.com/ajeetdsouza/zoxide
      programs.zoxide = {
        enable = true;

        enableBashIntegration = true;
      };
    };
}
