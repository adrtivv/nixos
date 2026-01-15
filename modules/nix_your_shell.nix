{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    {
      ...
    }:
    {
      programs.nix-your-shell = {
        enable = true;

        enableZshIntegration = true;

        nix-output-monitor.enable = true;
      };
    };
}
