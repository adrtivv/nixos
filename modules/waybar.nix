{...}: {
  # flake.modules.homemanager.waybar = {
  #   config,
  #   lib,
  #   ...
  # }: {
  #   # https://nix.catppuccin.com/options/main/home/catppuccin.waybar/#catppuccin-waybar.enable
  #   catppuccin.waybar = lib.mkif config.catppuccin.enable {
  #     # https://nix.catppuccin.com/options/main/home/catppuccin.waybar/#catppuccin-waybar.mode
  #     mode = "prependimport";
  #   };

  #   # https://home-manager-options.extranix.com/?query=programs.waybar&release=master
  #   # https://github.com/alexays/waybar
  #   programs.waybar = {
  #     enable = true;

  #     # https://github.com/alexays/waybar/wiki/configuration#bar-config
  #     settings = {
  #       # https://github.com/alexays/waybar/wiki/module:-backlight
  #       backlight = {
  #         format = "    {percent}%";

  #         interval = 2;
  #       };

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Battery
  #       battery = {
  #         bat = "BAT1";

  #         format-time = "{H} hour(s) {M} minute(s)";

  #         format-charging-critical = "󰂏 󰯈  {capacity}%";

  #         format-charging-optimal = "󰂏 󰇵  {capacity}%";

  #         format-charging-over_charge = "󰂏 󰱪  {capacity}%";

  #         format-charging-under_charge = "󰂏   {capacity}%";

  #         format-discharging-critical = "󰂌 󰯈  {capacity}%";

  #         format-discharging-optimal = "󰂌 󰇵  {capacity}%";

  #         format-discharging-over_charge = "󰂌 󰱪  {capacity}%";

  #         format-discharging-under_charge = "󰂌   {capacity}%";

  #         format-plugged-critical = "󰁹 󰯈  {capacity}%";

  #         format-plugged-optimal = "󰁹 󰇵  {capacity}%";

  #         format-plugged-over_charge = "󰁹 󰱪  {capacity}%";

  #         format-plugged-under_charge = "󰁹   {capacity}%";

  #         interval = 10;

  #         states = {
  #           critical = 10;

  #           optimal = 80;

  #           over_charge = 100;

  #           under_charge = 20;
  #         };

  #         tooltip = true;

  #         tooltip-format = "{timeTo}\n\nPower draw: {power} watt(s)\nCharge cycles the highest-capacity battery has seen: {cycles}\nMaximum charge relative to it's design capacity(health): {health}%";
  #       };

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Bluetooth
  #       bluetooth = {};

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Clock
  #       clock = {
  #         # "calendar"= {
  #         # 	"mode"= "month";

  #         # 	"mode-mon-col": 3,

  #         # 	"weeks-pos"= "left";

  #         # 	"on-scroll": 1

  #         # },

  #         format = "   {:%FT%T}";

  #         interval = 1;

  #         locale = "";

  #         timezones = ["Asia/Kolkata" "America/New_York"];

  #         tooltip = true;

  #         tooltip-format = "{tz_list}";
  #       };

  #       # https://github.com/Alexays/Waybar/wiki/Module:-CPU
  #       cpu = {
  #         format = "   use/load: {usage}/{load} %";

  #         interval = 10;

  #         tooltip = true;
  #       };

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Custom
  #       "custom/external_backlight" = {
  #         # "exec"= "~/.config/waybar/external_backlight.sh get";

  #         # "format"= "external backlight: {text}"
  #         format = " 󰍹  10%";

  #         # "on-click"= "~/.config/waybar/external_backlight.sh left_click";

  #         # "on-click-right"= "~/.config/waybar/external_backlight.sh right_click";

  #         # "on-scroll-down"= "~/.config/waybar/external_backlight.sh down";

  #         # "on-scroll-up"= "~/.config/waybar/external_backlight.sh up";

  #         # "signal": 8
  #       };

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Disk
  #       disk = {};

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-Gamemode
  #       # "gamemode":{},

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-Group
  #       # 	"group/audio":{},

  #       # 	"group/monitoring":{},

  #       # 	"group/display":{},

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Idle-Inhibitor
  #       idle_inhibitor = {
  #         format = "idle {icon}";

  #         format-icons = {
  #           activated = "";

  #           deactivated = "";
  #         };
  #       };

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-Image
  #       # "image"= {},

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-JACK
  #       # "jack"= {},

  #       layer = "top";

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Memory
  #       memory = {
  #         format = "   {used} GiB";

  #         interval = 30;

  #         tooltip = true;

  #         tooltip-format = "Total memory: {total} GiB\nUsed memory: {used} GiB\nAvailable memory: {avail} GiB\nTotal swap: {swapTotal} GiB\nUsed swap: {swapUsed} GiB\nAvailable swap: {swapAvail} GiB";
  #       };

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-MPD
  #       # "mpd"= {},

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-MPRIS
  #       # "mpris"= {},

  #       modules-center = [];

  #       modules-left = [
  #         "niri/workspaces"

  #         "clock"

  #         "cpu"

  #         "temperature"

  #         "memory"

  #         "systemd-failed-units"

  #         "privacy"
  #       ];

  #       modules-right = [
  #         "idle_inhibitor"

  #         "power-profiles-daemon"

  #         "bluetooth"

  #         "network"

  #         "pulseaudio"

  #         "backlight"

  #         "custom/external_backlight"

  #         "battery"
  #       ];

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Network
  #       network = {
  #         format-disabled = "󰀂   {ifname}";

  #         format-disconnected = "󰯡  {ifname}";

  #         format-ethernet = "󰀂   {ifname}";

  #         format-linked = "󰀂   {ifname}";

  #         format-wifi = "󰀂   {ifname}  {bandwidthDownBytes}  {bandwidthUpBytes}    {signalStrength}";

  #         interval = 5;

  #         tooltip = true;

  #         tooltip-ethernet = "{ifname}:\n\nessid: {essid}\ndownload speed: {bandwidthDownBytes}\nupload speed:{bandwidthUpBytes}";

  #         tooltip-format-disabled = "{ifname}:\n\nessid: {essid}\ndownload speed: {bandwidthDownBytes}\nupload speed:{bandwidthUpBytes}";

  #         tooltip-format-disconnected = "{ifname}:\n\nessid: {essid}\ndownload speed: {bandwidthDownBytes}\nupload speed:{bandwidthUpBytes}";

  #         tooltip-format-linked = "{ifname}:\n\nessid: {essid}\ndownload speed: {bandwidthDownBytes}\nupload speed:{bandwidthUpBytes}";

  #         tooltip-format-wifi = "{ifname}:\n\nessid: {essid}\nfrequency: {frequency}\ndownload speed: {bandwidthDownBytes}\nupload speed:{bandwidthUpBytes}\nsignal strength: {signalStrength}\nsignal strength";
  #       };

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Niri#language
  #       "niri/language" = {
  #         format = "Language: {long}";

  #         format-en = "MURICA";
  #       };

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Niri#window
  #       "niri/window" = {
  #         format = "{title}";
  #       };

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Niri#workspaces
  #       "niri/workspaces" = {
  #         all-outputs = false;

  #         current-only = false;

  #         disable-click = false;

  #         format = "{value}";
  #       };

  #       # "mode"= "hide";

  #       position = "bottom";

  #       # https://github.com/Alexays/Waybar/wiki/Module:-PowerProfilesDaemon
  #       power-profiles-daemon = {};

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Privacy
  #       privacy = {
  #         expand = false;

  #         icon-spacing = 4;

  #         icon-size = 20;

  #         ignore = [
  #           {
  #             type = "";
  #           }
  #         ];

  #         tooltip = true;

  #         tooltip-icon-size = 24;

  #         transition-duration = 250;

  #         modules = [
  #           {
  #             type = "screenshare";
  #           }

  #           {
  #             type = "audio-in";
  #           }

  #           {
  #             type = "audio-out";
  #           }
  #         ];
  #       };

  #       # https://github.com/Alexays/Waybar/wiki/Module:-PulseAudio
  #       pulseaudio = {
  #         format = "   {volume}%";
  #       };

  #       reload_style_on_change = true;

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-Sndio
  #       # "sndio"= {},

  #       start_hidden = false;

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Systemd-failed-units
  #       systemd-failed-units = {
  #         format = "{nr_failed} systemd fail(s)";

  #         hide-on-ok = true;

  #         system = true;

  #         user = true;
  #       };

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-Taskbar
  #       # "taskbar"= {},

  #       # https://github.com/Alexays/Waybar/wiki/Module:-Temperature
  #       temperature = {
  #         critical-threshold = 90;

  #         format = "  {temperatureC}C";

  #         format-critical = "󱗗  {temperatureC}C";

  #         interval = 10;
  #       };

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-Tray
  #       # "tray"= {},

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-UPower
  #       # "upower"= {},

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-WirePlumber
  #       # "wireplumber"= {},

  #       # # https://github.com/Alexays/Waybar/wiki/Module:-Workspaces
  #       # "workspaces"= {}
  #     };

  #     style = ''
  #       @define-color rosewater #f5e0dc;
  #       @define-color flamingo #f2cdcd;
  #       @define-color pink #f5c2e7;
  #       @define-color mauve #cba6f7;
  #       @define-color red #f38ba8;
  #       @define-color maroon #eba0ac;
  #       @define-color peach #fab387;
  #       @define-color yellow #f9e2af;
  #       @define-color green #a6e3a1;
  #       @define-color teal #94e2d5;
  #       @define-color sky #89dceb;
  #       @define-color sapphire #74c7ec;
  #       @define-color blue #89b4fa;
  #       @define-color lavender #b4befe;
  #       @define-color text #cdd6f4;
  #       @define-color subtext1 #bac2de;
  #       @define-color subtext0 #a6adc8;
  #       @define-color overlay2 #9399b2;
  #       @define-color overlay1 #7f849c;
  #       @define-color overlay0 #6c7086;
  #       @define-color surface2 #585b70;
  #       @define-color surface1 #45475a;
  #       @define-color surface0 #313244;
  #       @define-color base #1e1e2e;
  #       @define-color mantle #181825;
  #       @define-color crust #11111b;

  #       * {
  #       	color: @text;
  #       	font-size: 1.5rem;
  #       }

  #       #backlight {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       /* #backlight-slider highlight { */
  #       	/* background-color: @crust; */
  #       	/* border-color: @crust; */
  #       /* } */

  #       /* #backlight-slider slider { */
  #       	/* color: @crust; */
  #       	/* background-color: @crust; */
  #       /* } */

  #       /* #backlight-slider trough { */
  #       	/* background-color: transparent; */
  #       	/* border-color: @crust; */
  #       	/* border-radius: 1rem; */
  #       	/* min-height: 0.6rem; */
  #       	/* min-width: 10rem; */
  #       /* } */

  #       #battery {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       /* #battery.charging.critical { */
  #       /* } */

  #       /* #battery.charging.optimal { */
  #       /* } */

  #       /* #battery.charging.over_charge { */
  #       /* } */

  #       /* #battery.charging.under_charge { */
  #       /* } */

  #       /* #battery.discharging.critical { */
  #       /* } */

  #       /* #battery.discharging.optimal { */
  #       /* } */

  #       /* #battery.discharging.over_charge { */
  #       /* } */

  #       /* #battery.discharging.under_charge { */
  #       /* } */

  #       /* #battery.plugged.critical { */
  #       /* } */

  #       /* #battery.plugged.optimal { */
  #       /* } */

  #       /* #battery.plugged.over_charge { */
  #       /* } */

  #       /* #battery.plugged.under_charge { */
  #       /* } */

  #       #bluetooth {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #clock {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #cpu {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #custom-external_backlight {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #idle_inhibitor {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       /* https://github.com/Alexays/Waybar/wiki/Module:-Niri#language */
  #       /* #language { */

  #       /* } */

  #       #load {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #memory {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       /* .modules-center { */
  #       /* } */

  #       /* .modules-left { */
  #       /* } */

  #       /* .modules-right { */
  #       /* } */

  #       #network {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #privacy {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #pulseaudio{
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #systemd-failed-units {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #temperature {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       #temperature.critical {
  #       	background-color: @crust;
  #       	margin-left: 0.2rem;
  #       	margin-right: 0.2rem;
  #       }

  #       /* https://github.com/Alexays/Waybar/wiki/Module:-Niri#window */
  #       /* #window { */
  #       /* } */

  #       /* window#waybar.hidden {} */

  #       /* window#waybar.<position> */

  #       /* https://github.com/Alexays/Waybar/wiki/Module:-Niri#workspaces */
  #       /* #workspaces {} */

  #       /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect` */
  #       #workspaces button:hover {
  #       	box-shadow: inherit;
  #       	text-shadow: inherit;
  #       }

  #       window#waybar {
  #       	background-color: transparent;
  #       }

  #     '';

  #     systemd.enable = true;
  #   };

  #   # systemd.user.services.waybar = {
  #   #   Install.WantedBy = ["niri.service"];
  #   # };
  # };
}
