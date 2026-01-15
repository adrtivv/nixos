{ inputs, ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      imports = [
        inputs.dank_material_shell.homeModules.niri
      ];

      # https://github.com/AvengeMedia/DankMaterialShell/blob/master/nix/niri.nix
      programs.dank-material-shell.niri.includes = {
        enable = true;

        filesToInclude = [
          "alttab"

          "binds"

          "colors"

          "layout"

          "outputs"

          "wpblur"
        ];

        originalFileName = "hm";

        override = true;
      };
    };
}
