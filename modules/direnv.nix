{ ... }:
{
  flake.modules.homeManager.direnv =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.direnv&release=master
      # https://direnv.net/
      programs.direnv = {
        enable = true;

        enableZshIntegration = true;

        nix-direnv.enable = true;
      };
    };
}
