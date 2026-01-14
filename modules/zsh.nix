{ ... }:
{
  flake.modules.homeManager.zsh =
    { ... }:
    {
      programs.zsh = {
        autosuggestion.enable = true;

        enable = true;

        syntaxHighlighting.enable = true;
      };
    };

  flake.modules.nixos.zsh =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;

      users.defaultUserShell = pkgs.zsh;
    };
}
