{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.opencode&release=master
      # https://opencode.ai/docs
      programs.opencode = {
        enable = true;
      };
    };
}
