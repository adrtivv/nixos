{...}: {
  flake.modules.homeManager.gaming = {pkgs, ...}: {
    home = {
      packages = with pkgs; [
        protonup
      ];

      sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
      };
    };
  };

  flake.modules.nixos.gaming = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      bottles

      heroic

      lutris
    ];

    programs.gamemode.enable = true;

    programs.steam = {
      enable = true;

      extraPackages = [
        pkgs.mangohud
      ];

      gamescopeSession.enable = true;
    };
  };
}
