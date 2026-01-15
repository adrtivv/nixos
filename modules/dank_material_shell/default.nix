{ inputs, ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      imports = [
        inputs.dank_material_shell.homeModules.dank-material-shell

        inputs.dank_material_shell_plugin_registry.modules.default
      ];

      # https://github.com/AvengeMedia/DankMaterialShell?tab=readme-ov-file#nixos---via-home-manager
      # https://github.com/AvengeMedia/DankMaterialShell/blob/master/nix/default.nix
      programs.dank-material-shell = {
        enable = true;

        enableAudioWavelength = false;

        enableCalendarEvents = false;

        enableClipboardPaste = true;

        enableDynamicTheming = true;

        enableSystemMonitoring = false;

        enableVPN = false;

        # https://plugins.danklinux.com/dank-hooks.html
        plugins = {
          # alarmClock.enable = true;

          dankBatteryAlerts.enable = true;

          dankLauncherKeys.enable = true;

          dankPomodoroTimer.enable = true;

          # displayManager.enable = true;

          # displayMirror.enable = true;

          # displaySettings.enable = true;

          # easyEffects.enable = true;

          # nixMonitor.enable = true;

          # powerUsagePlugin.enable = true;
        };

        systemd = {
          enable = true;

          restartIfChanged = true;
        };
      };
    };
}
