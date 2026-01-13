{ ... }:
{
  flake.modules.homeManager.gaming =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          protonup-rs
        ];

        # sessionVariables = {
        #   STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
        # };
      };

      # https://home-manager-options.extranix.com/?query=programs.mangohud&release=master
      programs.mangohud = {
        enable = true;

        settings = {
          cpu_temp = 1;

          gpu_temp = 1;

          gpu_junction_temp = 1;

          gpu_mem_temp = 1;
        };
      };
    };

  flake.modules.nixos.gaming =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        heroic

        mangohud
      ];

      programs.gamemode.enable = true;

      # programs.steam = {
      #   enable = true;

      #   extraPackages = [
      #     pkgs.mangohud
      #   ];

      #   gamescopeSession.enable = true;
      # };
    };
}
