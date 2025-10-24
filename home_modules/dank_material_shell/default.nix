{inputs, ...}: {
  flake.homeModules.dank_material_shell = {
    imports = [
      inputs.dank_material_shell.homeModules.dankMaterialShell.default
    ];

    # https://github.com/AvengeMedia/DankMaterialShell?tab=readme-ov-file#nixos---via-home-manager
    # https://github.com/AvengeMedia/DankMaterialShell/blob/master/nix/default.nix
    programs.dankMaterialShell = {
      enable = true;

      enableSystemd = true;

      enableVPN = false;

      enableAudioWavelength = false;

      # https://plugins.danklinux.com/dank-hooks.html
      plugins = {
        # https://plugins.danklinux.com/dank-actions.html
        "Dank Actions".src = "${inputs.dank_material_shell}/PLUGINS/Dank Actions";

        # https://plugins.danklinux.com/dank-battery-alerts.html
        "Dank Battery Alerts".src = "${inputs.dank_material_shell}/PLUGINS/Dank Battery Alerts";

        # https://plugins.danklinux.com/dank-hooks.html
        "Dank Hooks".src = "${inputs.dank_material_shell}/PLUGINS/Dank Hooks";

        # https://plugins.danklinux.com/dank-battery-alerts.html
        "Dank Pomodoro Timer".src = "${inputs.dank_material_shell}/PLUGINS/Dank Pomodoro Timer";
      };
    };
  };
}
