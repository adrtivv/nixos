{ ... }:
{
  flake.modules.homeManager.atuin =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.atuin&release=master
      # https://github.com/atuinsh/atuin
      programs.atuin = {
        daemon.enable = true;

        enable = true;

        enableZshIntegration = true;
      };
    };
}
