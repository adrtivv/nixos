{
  config,
  specialArgs,
  ...
}: {
  imports = [
    specialArgs.inputs.dank_material_shell.homeModules.dankMaterialShell.default

    specialArgs.inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  # https://github.com/AvengeMedia/DankMaterialShell?tab=readme-ov-file#nixos---via-home-manager
  # https://github.com/AvengeMedia/DankMaterialShell/blob/master/nix/default.nix
  programs.dankMaterialShell = {
    enable = true;

    # https://plugins.danklinux.com/dank-hooks.html
    # plugins = {
    #   # https://plugins.danklinux.com/dank-actions.html
    #   "Dank Actions".src = "${specialArgs.inputs.dank_material_shell}/PLUGINS/Dank Actions";

    #   # https://plugins.danklinux.com/dank-battery-alerts.html
    #   "Dank Battery Alerts".src = "${specialArgs.inputs.dank_material_shell}/PLUGINS/Dank Battery Alerts";

    #   # https://plugins.danklinux.com/dank-hooks.html
    #   "Dank Hooks".src = "${specialArgs.inputs.dank_material_shell}/PLUGINS/Dank Hooks";

    #   # https://plugins.danklinux.com/dank-battery-alerts.html
    #   "Dank Pomodoro Timer".src = "${specialArgs.inputs.dank_material_shell}/PLUGINS/Dank Pomodoro Timer";
    # };
  };
}
