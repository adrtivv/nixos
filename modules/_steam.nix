{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      home.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
      };
    };

  flake.modules.nixos.hosts__laptop =
    { pkgs, ... }:
    {
      programs.steam = {
        enable = true;

        extraPackages = [
          pkgs.mangohud
        ];

        gamescopeSession.enable = true;
      };
    };
}
