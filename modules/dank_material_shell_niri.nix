{ inputs, ... }:
{
  flake.modules.homeManager.dank_material_shell_niri =
    { ... }:
    {
      imports = [
        inputs.dank_material_shell.homeModules.niri
      ];

      # https://github.com/AvengeMedia/DankMaterialShell/blob/master/nix/niri.nix
      programs.dank-material-shell.niri = {
        enableKeybinds = true;

        enableSpawn = true;
      };
    };
}
