{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettings
      programs.niri.settings = {
        # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbinds
        binds = {
          "Mod+Shift+Slash" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamehotkey-overlayhidden
            action = config.lib.niri.actions.show-hotkey-overlay;
          };

          "Mod+T" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.spawn = lib.getExe pkgs.ghostty;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamehotkey-overlaytitle
            hotkey-overlay.title = "Open a terminal: ghostty";
          };

          "Mod+D" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.spawn = lib.getExe pkgs.walker;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamehotkey-overlaytitle
            hotkey-overlay.title = "Run an application: walker";
          };

          # "Super+Alt+L" = {
          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
          #   action.spawn = lib.getExe pkgs.swaylock;

          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamehotkey-overlaytitle
          #   hotkey-overlay.title = "Lock the screen: swaylock";
          # };

          "Super+Alt+S" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.spawn-sh = "pkill orca || exec orca";

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
            allow-when-locked = true;
          };

          # "XF86AudioLowerVolume" = {
          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
          #   action.spawn-sh = "wpctl set-volume @ DEFAULT_AUDIO_SINK@ 0.1-";

          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
          #   allow-when-locked = true;
          # };

          # "XF86AudioRaiseVolume" = {
          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
          #   action.spawn-sh = "wpctl set-volume @ DEFAULT_AUDIO_SINK@ 0.1+";

          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
          #   allow-when-locked = true;
          # };

          # "XF86AudioMute" = {
          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
          #   action.spawn-sh = "wpctl set-mute @ DEFAULT_AUDIO_SINK@ toggle";

          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
          #   allow-when-locked = true;
          # };

          # "XF86AudioMicMute" = {
          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
          #   action.spawn-sh = "wpctl set-mute @ default_audio_source@ toggle";

          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
          #   allow-when-locked = true;
          # };

          "XF86AudioPlay" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.spawn-sh = "playerctl play-pause";

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
            allow-when-locked = true;
          };

          "XF86AudioStop" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.spawn-sh = "playerctl stop";

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
            allow-when-locked = true;
          };

          "XF86AudioPrev" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.spawn-sh = "playerctl previous";

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
            allow-when-locked = true;
          };

          "XF86AudioNext" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.spawn-sh = "playerctl next";

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
            allow-when-locked = true;
          };

          # "XF86MonBrightnessDown" = {
          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
          #   action.spawn = "${lib.getExe pkgs.brightnessctl} --class=backlight set 5%-";

          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
          #   allow-when-locked = true;
          # };

          # "XF86MonBrightnessUp" = {
          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
          #   action.spawn = "${lib.getExe pkgs.brightnessctl} --class=backlight set 5%+";

          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameallow-when-locked
          #   allow-when-locked = true;
          # };

          "Mod+O" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.toggle-overview;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamerepeat
            repeat = false;
          };

          "Mod+Q" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.close-window;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamerepeat
            repeat = false;
          };

          "Mod+Left" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-left;
          };

          "Mod+Down" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-window-down;
          };

          "Mod+Up" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-window-up;
          };

          "Mod+Right" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-right;
          };

          "Mod+H" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-left;
          };

          "Mod+J" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-window-down;
          };

          "Mod+K" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-window-up;
          };

          "Mod+L" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-right;
          };

          "Mod+Ctrl+Left" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-left;
          };

          "Mod+Ctrl+Down" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-window-down;
          };

          "Mod+Ctrl+Up" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-window-up;
          };

          "Mod+Ctrl+Right" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-right;
          };

          "Mod+Ctrl+H" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-left;
          };

          "Mod+Ctrl+J" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-window-down;
          };

          "Mod+Ctrl+K" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-window-up;
          };

          "Mod+Ctrl+L" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-right;
          };

          "Mod+Home" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-first;
          };

          "Mod+End" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-last;
          };

          "Mod+Ctrl+Home" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-first;
          };

          "Mod+Ctrl+End" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-last;
          };

          "Mod+Shift+Left" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-monitor-left;
          };

          "Mod+Shift+Down" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-monitor-down;
          };

          "Mod+Shift+Up" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-monitor-up;
          };

          "Mod+Shift+Right" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-monitor-right;
          };

          "Mod+Shift+H" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-monitor-left;
          };

          "Mod+Shift+J" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-monitor-down;
          };

          "Mod+Shift+K" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-monitor-up;
          };

          "Mod+Shift+L" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-monitor-right;
          };

          "Mod+Shift+Ctrl+Left" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-monitor-left;
          };

          "Mod+Shift+Ctrl+Down" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-monitor-down;
          };

          "Mod+Shift+Ctrl+Up" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-monitor-up;
          };

          "Mod+Shift+Ctrl+Right" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-monitor-right;
          };

          "Mod+Shift+Ctrl+H" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-monitor-left;
          };

          "Mod+Shift+Ctrl+J" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-monitor-down;
          };

          "Mod+Shift+Ctrl+K" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-monitor-up;
          };

          "Mod+Shift+Ctrl+L" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-monitor-right;
          };

          "Mod+Page_Down" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-workspace-down;
          };

          "Mod+Page_Up" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-workspace-up;
          };

          "Mod+U" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-workspace-down;
          };

          "Mod+I" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-workspace-up;
          };

          "Mod+Ctrl+Page_Down" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-workspace-down;
          };

          "Mod+Ctrl+Page_Up" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-workspace-up;
          };

          "Mod+Ctrl+U" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-workspace-down;
          };

          "Mod+Ctrl+I" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-workspace-up;
          };

          "Mod+Shift+Page_Down" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-workspace-down;
          };

          "Mod+Shift+Page_Up" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-workspace-up;
          };

          "Mod+Shift+U" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-workspace-down;
          };

          "Mod+Shift+I" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-workspace-up;
          };

          "Mod+WheelScrollDown" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-workspace-down;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamecooldown-ms
            cooldown-ms = 150;
          };

          "Mod+WheelScrollUp" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-workspace-up;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamecooldown-ms
            cooldown-ms = 150;
          };

          "Mod+Ctrl+WheelScrollDown" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-workspace-down;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamecooldown-ms
            cooldown-ms = 150;
          };

          "Mod+Ctrl+WheelScrollUp" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-to-workspace-up;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnamecooldown-ms
            cooldown-ms = 150;
          };

          "Mod+WheelScrollRight" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-right;
          };

          "Mod+WheelScrollLeft" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-left;
          };

          "Mod+Ctrl+WheelScrollRight" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-right;
          };

          "Mod+Ctrl+WheelScrollLeft" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-left;
          };

          "Mod+Shift+WheelScrollDown" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-right;
          };

          "Mod+Shift+WheelScrollUp" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.focus-column-left;
          };

          "Mod+Ctrl+Shift+WheelScrollDown" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-right;
          };

          "Mod+Ctrl+Shift+WheelScrollUp" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.move-column-left;
          };

          "Mod+1" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.focus-workspace = 1;
          };

          "Mod+2" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.focus-workspace = 2;
          };

          "Mod+3" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.focus-workspace = 3;
          };

          "Mod+4" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.focus-workspace = 4;
          };

          "Mod+5" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.focus-workspace = 5;
          };

          "Mod+6" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.focus-workspace = 6;
          };

          "Mod+7" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.focus-workspace = 7;
          };

          "Mod+8" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.focus-workspace = 8;
          };

          "Mod+9" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.focus-workspace = 9;
          };

          "Mod+Ctrl+1" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.move-column-to-workspace = 1;
          };

          "Mod+Ctrl+2" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.move-column-to-workspace = 2;
          };

          "Mod+Ctrl+3" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.move-column-to-workspace = 3;
          };

          "Mod+Ctrl+4" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.move-column-to-workspace = 4;
          };

          "Mod+Ctrl+5" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.move-column-to-workspace = 5;
          };

          "Mod+Ctrl+6" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.move-column-to-workspace = 6;
          };

          "Mod+Ctrl+7" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.move-column-to-workspace = 7;
          };

          "Mod+Ctrl+8" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.move-column-to-workspace = 8;
          };

          "Mod+Ctrl+9" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.move-column-to-workspace = 9;
          };

          "Mod+BracketLeft" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.consume-or-expel-window-left;
          };

          "Mod+BracketRight" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.consume-or-expel-window-right;
          };

          # "Mod+Comma" = {
          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
          #   action = config.lib.niri.actions.consume-window-into-column;
          # };

          "Mod+Period" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.expel-window-from-column;
          };

          "Mod+R" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.switch-preset-column-width;
          };

          "Mod+Shift+R" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.switch-preset-window-height;
          };

          "Mod+Ctrl+R" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.reset-window-height;
          };

          "Mod+F" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.maximize-column;
          };

          "Mod+Shift+F" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.fullscreen-window;
          };

          "Mod+Ctrl+F" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.expand-column-to-available-width;
          };

          "Mod+C" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.center-column;
          };

          "Mod+Ctrl+C" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.center-visible-columns;
          };

          "Mod+Minus" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.set-column-width = "-10%";
          };

          "Mod+Equal" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.set-column-width = "+10%";
          };

          "Mod+Shift+Minus" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.set-window-height = "-10%";
          };

          "Mod+Shift+Equal" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action.set-window-height = "+10%";
          };

          # "Mod+V" = {
          #   # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
          #   action = config.lib.niri.actions.toggle-window-floating;
          # };

          "Mod+Shift+V" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.switch-focus-between-floating-and-tiling;
          };

          "Mod+W" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.toggle-column-tabbed-display;
          };

          "Print" = {
            # # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            # # Uncomment this when [this (https://github.com/sodiboo/niri-flake/issues/1380) issue is fixed.
            # # action = config.lib.niri.actions.screenshot;
            # # Remove when [this (https://github.com/sodiboo/niri-flake/issues/1380) issue is fixed.
            # action.screenshot = [ ];

            action.spawn-sh = ''
              tmp_img="$(mktemp --suffix=.png)"

              trap 'rm -f "$tmp_img"' EXIT

              ${lib.getExe pkgs.niri-unstable} msg action screenshot --path "$tmp_img" || exit 1

              while [ ! -s "$tmp_img" ]; do
                sleep 0.5
              done

              ${lib.getExe pkgs.satty} --filename "$tmp_img"
            '';
          };

          "Ctrl+Print" = {
            # # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            # # Uncomment this when [this (https://github.com/sodiboo/niri-flake/issues/1380) issue is fixed.
            # # action = config.lib.niri.actions.screenshot-screen;
            # # Remove when [this (https://github.com/sodiboo/niri-flake/issues/1380) issue is fixed.
            # action.screenshot-screen = [ ];

            action.spawn-sh = ''
              tmp_img="$(mktemp --suffix=.png)"

              trap 'rm -f "$tmp_img"' EXIT

              ${lib.getExe pkgs.niri-unstable} msg action screenshot-screen --path "$tmp_img" || exit 1

              while [ ! -s "$tmp_img" ]; do
                sleep 0.5
              done

              ${lib.getExe pkgs.satty} --filename "$tmp_img"
            '';
          };

          "Alt+Print" = {
            # # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            # # Uncomment this when [this (https://github.com/sodiboo/niri-flake/issues/1380) issue is fixed.
            # # action = config.lib.niri.actions.screenshot-window;
            # # Remove when [this (https://github.com/sodiboo/niri-flake/issues/1380) issue is fixed.
            # action.screenshot-window = [ ];

            action.spawn-sh = ''
              tmp_img="$(mktemp --suffix=.png)"

              trap 'rm -f "$tmp_img"' EXIT

              ${lib.getExe pkgs.niri-unstable} msg action screenshot-window --path "$tmp_img" || exit 1

              while [ ! -s "$tmp_img" ]; do
                sleep 0.5
              done

              ${lib.getExe pkgs.satty} --filename "$tmp_img"
            '';
          };

          "Mod+Escape" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.toggle-keyboard-shortcuts-inhibit;

            # https://x.com/AKato45
            allow-inhibiting = false;
          };

          "Mod+Shift+E" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.quit;
          };

          "Ctrl+Alt+Delete" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.quit;
          };

          "Mod+Shift+P" = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
            action = config.lib.niri.actions.power-off-monitors;
          };
        };
      };
    };
}
