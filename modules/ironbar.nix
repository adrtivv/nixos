{...}: {
  # flake.modules.homeManager.ironbar = {pkgs, ...}: {
  #   # https://search.nixos.org/packages?channel=unstable&show=ironbar&query=ironbar
  #   # https://github.com/JakeStanger/ironbar
  #   home.packages = [
  #     pkgs.ironbar

  #     # https://github.com/JakeStanger/ironbar/wiki/battery
  #     pkgs.upower
  #   ];

  #   xdg.configFile."ironbar/config.json".text = ''
  #     {
  #     	"$schema": "https://f.jstanger.dev/github/ironbar/schema.json",

  #     	"anchor_to_edges": true,

  #     	"center": [],

  #     	"end": [
  #     		{
  #     			"type": "notifications"
  #     		},

  #     		{
  #     			"type": "tray"
  #     		},

  #     		{
  #     			"max_items": 1000,
  #     			"type": "clipboard"
  #     		},

  #     		{
  #     			"type": "bluetooth"
  #     		},

  #     		{
  #     			"type": "network_manager"
  #     		},

  #     		{
  #     			"type": "volume"
  #     		},

  #     		{
  #     			"format": "{percentage}%",

  #     			"thresholds": {
  #     				"critical": 10,

  #     				"optimal": 80,

  #     				"over_charge": 100,

  #     				"under_charge": 20
  #     			},

  #     			"type": "battery"
  #     		},

  #     		{
  #     			"format": "%Y-%m-%dT%H:%M",

  #     			"type": "clock"
  #     		},

  #     		{
  #     			"bar": [
  #     				{
  #     					"label": "",

  #     					"name": "power-btn",

  #     					"on_click": "popup:toggle",

  #     					"type": "button"
  #     				}
  #     			],

  #     			"class": "power-menu",

  #     			"popup": [
  #     				{
  #     					"orientation": "vertical",

  #     					"type": "box",

  #     					"widgets": [
  #     						{
  #     							"label": "Power menu",

  #     							"name": "header",

  #     							"type": "label"
  #     						},

  #     						{
  #     							"type": "box",

  #     							"widgets": [
  #     								{
  #     									"class": "power-btn",

  #     									"label": "<span font-size='40pt'></span>",

  #     									"on_click": "!shutdown now",

  #     									"type": "button"
  #     								},

  #     								{
  #     									"class": "power-btn",

  #     									"label": "<span font-size='40pt'></span>",

  #     									"on_click": "!reboot",

  #     									"type": "button"
  #     								}
  #     							]
  #     						},

  #     						{
  #     							"label": "Uptime: {{30000:uptime -p | cut -d ' ' -f2-}}",

  #     							"name": "uptime",

  #     							"type": "label"
  #     						}
  #     					]
  #     				}
  #     			],

  #     			"tooltip": "Up: {{30000:uptime -p | cut -d ' ' -f2-}}",

  #     			"type": "custom"
  #     		}
  #     	],

  #     	"height": 32,

  #     	"ironvar_defaults": {},

  #     	"margin": {
  #     		"bottom": 0,

  #     		"left": 0,

  #     		"right": 0,

  #     		"top": 0
  #     	},

  #     	"popup_gap": 1,

  #     	"position": "bottom",

  #     	"start": [
  #     		{
  #     			"type": "workspaces"
  #     		}
  #     	]
  #     }
  #   '';

  #   # xdg.configFile."ironbar/config.jsonc".text = ''

  #   #   {
  #   #   	"$schema": "https://f.jstanger.dev/github/ironbar/schema.json",
  #   #   	"anchor_to_edges": true,
  #   #   	"autohide": 0,
  #   #   	"center": [
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/clock
  #   #   		{
  #   #   			"format": "%Y-%m-%dT%H:%M",
  #   #   			"type": "clock"
  #   #   		}
  #   #   	],
  #   #   	"end": [
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/notifications
  #   #   		{
  #   #   			"type": "notifications"
  #   #   		},
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/music
  #   #   		{
  #   #   			"type": "music"
  #   #   		},
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/tray
  #   #   		{
  #   #   			"type": "tray"
  #   #   		},
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/clipboard
  #   #   		{
  #   #   			"type": "clipboard"
  #   #   		},
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/sys-info
  #   #   		{
  #   #   			"type": "sys_info"
  #   #   		},
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/bluetooth
  #   #   		{
  #   #   			"type": "bluetooth"
  #   #   		},
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/network-manager
  #   #   		{
  #   #   			"type": "network_manager"
  #   #   		},
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/volume
  #   #   		{
  #   #   			"type": "volume"
  #   #   		},
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/battery
  #   #   		{
  #   #   			"type": "battery"
  #   #   		},
  #   #   		// https://github.com/JakeStanger/ironbar/wiki/Power-Menu
  #   #   		{
  #   #   			"bar": [
  #   #   				{
  #   #   					"label": "",
  #   #   					"name": "power-btn",
  #   #   					"on_click": "popup:toggle",
  #   #   					"type": "button"
  #   #   				}
  #   #   			],
  #   #   			"class": "power-menu",
  #   #   			"popup": [
  #   #   				{
  #   #   					"orientation": "vertical",
  #   #   					"type": "box",
  #   #   					"widgets": [
  #   #   						{
  #   #   							"label": "Power menu",
  #   #   							"name": "header",
  #   #   							"type": "label"
  #   #   						},
  #   #   						{
  #   #   							"type": "box",
  #   #   							"widgets": [
  #   #   								{
  #   #   									"class": "power-btn",
  #   #   									"label": "<span font-size='40pt'></span>",
  #   #   									"on_click": "!shutdown now",
  #   #   									"type": "button"
  #   #   								},
  #   #   								{
  #   #   									"class": "power-btn",
  #   #   									"label": "<span font-size='40pt'></span>",
  #   #   									"on_click": "!reboot",
  #   #   									"type": "button"
  #   #   								}
  #   #   							]
  #   #   						},
  #   #   						{
  #   #   							"label": "Uptime: {{30000:uptime -p | cut -d ' ' -f2-}}",
  #   #   							"name": "uptime",
  #   #   							"type": "label"
  #   #   						}
  #   #   					]
  #   #   				}
  #   #   			],
  #   #   			"tooltip": "Up: {{30000:uptime -p | cut -d ' ' -f2-}}",
  #   #   			"type": "custom"
  #   #   		}
  #   #   	],
  #   #   	"height": 32,
  #   #   	"ironvar_defaults": {},
  #   #   	"margin": {
  #   #   		"bottom": 0,
  #   #   		"left": 0,
  #   #   		"right": 0,
  #   #   		"top": 0
  #   #   	},
  #   #   	"popup_gap": 1,
  #   #   	"position": "bottom",
  #   #   	"start": [
  #   #   		{
  #   #   			"type": "workspaces"
  #   #   		}
  #   #   	],
  #   #   	"start_hidden": true
  #   #   }
  #   # '';

  #   xdg.configFile."ironbar/style.css".text = ''
  #     /* https://github.com/JakeStanger/ironbar/wiki/styling-guide */

  #     #bar {
  #     }

  #     #bar #start {
  #     }

  #     #bar #center {
  #     }

  #     #bar #end {
  #     }

  #     #widget-container {
  #     }

  #     .background {
  #     }

  #     /* https://github.com/JakeStanger/ironbar/wiki/battery#styling */
  #     .battery {
  #     }

  #     .battery.critical {
  #     }

  #     .battery.optimal {
  #     }

  #     .battery.over_charge {
  #     }

  #     .battery.under_charge {
  #     }

  #     .battery .contents {
  #     }

  #     .battery .icon {
  #     }

  #     .battery .label {
  #     }

  #     /* https://github.com/JakeStanger/ironbar/wiki/bluetooth#styling */
  #     .bluetooth {
  #     }

  #     .bluetooth.connected {
  #     }

  #     .bluetooth.disabled {
  #     }

  #     .bluetooth.enabled {
  #     }

  #     .bluetooth.not-found {
  #     }

  #     .container {
  #     }

  #     .popup {
  #     }

  #     /* https://github.com/JakeStanger/ironbar/wiki/battery#styling */
  #     .popup-battery {
  #     }

  #     .popup-battery .details {
  #     }

  #     /* https://github.com/JakeStanger/ironbar/wiki/bluetooth#styling */
  #     .popup-bluetooth {
  #     }

  #     .popup-bluetooth .header {
  #     }

  #     .popup-bluetooth .header .switch {
  #     }

  #     .popup-bluetooth .header .label {
  #     }

  #     .popup-bluetooth .disabled {
  #     }

  #     .popup-bluetooth .disabled .spinner {
  #     }

  #     .popup-bluetooth .disabled .label {
  #     }

  #     .popup-bluetooth .devices {
  #     }

  #     .popup-bluetooth .devices .box {
  #     }

  #     .popup-bluetooth .devices .box .device {
  #     }

  #     .popup-bluetooth .devices .box .device .icon-box {
  #     }

  #     .popup-bluetooth .devices .box .device .icon-box .icon {
  #     }

  #     .popup-bluetooth .devices .box .device .icon-box .text-icon {
  #     }

  #     .popup-bluetooth .devices .box .device .icon-box .image {
  #     }

  #     .popup-bluetooth .devices .box .device .icon-box .status {
  #     }

  #     .popup-bluetooth .devices .box .device .icon-box .header-label {
  #     }

  #     .popup-bluetooth .devices .box .device .icon-box .footer-label {
  #     }

  #     .popup-bluetooth .devices .box .device .icon-box .switch {
  #     }

  #     .popup-bluetooth .devices .box .device .icon-box .spinner {
  #     }

  #     .popup-clock {
  #     }

  #     .widget {
  #     }
  #   '';

  # };
}
