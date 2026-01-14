{ ... }:
{
  flake.modules.homeManager.nix_your_shell =
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
