{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      programs.zsh = {
        autosuggestion.enable = true;

        enable = true;

        syntaxHighlighting.enable = true;
      };
    };

  flake.modules.nixos.hosts__laptop =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;

      users.defaultUserShell = pkgs.zsh;
    };
}
