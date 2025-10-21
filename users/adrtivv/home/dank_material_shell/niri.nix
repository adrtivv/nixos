{specialArgs, ...}: {
  imports = [
    specialArgs.inputs.dank_material_shell.homeModules.dankMaterialShell.niri
  ];

  # https://github.com/AvengeMedia/DankMaterialShell/blob/master/nix/niri.nix
  programs.dankMaterialShell.niri = {
    enableKeybinds = true;
  };
}
