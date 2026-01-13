{ inputs, ... }:
{
  flake.modules.homeManager.dank_material_shell =
    { ... }:
    {
      imports = [
        inputs.dank_material_shell.homeModules.dank-material-shell
      ];

      # https://github.com/AvengeMedia/DankMaterialShell?tab=readme-ov-file#nixos---via-home-manager
      # https://github.com/AvengeMedia/DankMaterialShell/blob/master/nix/default.nix
      programs.dank-material-shell = {
        enable = true;

        enableDynamicTheming = true;

        # https://plugins.danklinux.com/dank-hooks.html
        plugins = {
          # https://plugins.danklinux.com/dank-actions.html
          "Dank Actions".src = "${inputs.dank_material_shell_plugins}/DankActions";

          # https://plugins.danklinux.com/dank-battery-alerts.html
          "Dank Battery Alerts".src = "${inputs.dank_material_shell_plugins}/DankBatteryAlerts";

          # https://plugins.danklinux.com/dank-hooks.html
          "Dank Hooks".src = "${inputs.dank_material_shell_plugins}/DankHooks";

          # https://plugins.danklinux.com/dank-battery-alerts.html
          "Dank Pomodoro Timer".src = "${inputs.dank_material_shell_plugins}/DankPomodoroTimer";
        };

        systemd = {
          enable = true;

          restartIfChanged = true;
        };
      };
    };
}
