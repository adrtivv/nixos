{inputs, ...}: {
  flake.modules.homeManager.niri = {
    config,
    lib,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      # https://search.nixos.org/packages?channel=unstable&show=kdePackages.dolphin&query=kdePackages.dolphin
      kdePackages.dolphin

      # https://search.nixos.org/packages?channel=unstable&show=kdePackages.polkit-kde-agent-1&query=kdePackages.polkit-kde-agent-1
      # https://yalter.github.io/niri/Important-Software.html#authentication-agent
      kdePackages.polkit-kde-agent-1

      # https://yalter.github.io/niri/Important-Software.html#xwayland
      # https://search.nixos.org/packages?channel=unstable&show=xwayland-satellite&query=xwayland-satellite
      # https://github.com/Supreeeme/xwayland-satellite
      xwayland-satellite-stable
    ];

    # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettings
    programs.niri.settings = {
      cursor = {
        # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingscursorhide-after-inactive-ms
        hide-after-inactive-ms = 3000;
      };

      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsenvironment
      environment = {
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };

      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingshotkey-overlayskip-at-startup
      hotkey-overlay.skip-at-startup = false;

      input = {
        # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsinputfocus-follows-mousemax-scroll-amount
        focus-follows-mouse.max-scroll-amount = "0%";

        touchpad = {
          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsinputtouchpadnatural-scroll
          natural-scroll = true;

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsinputtouchpadtap
          tap = true;
        };
      };

      layout = {
        border = {
          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutborderactive
          active = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#decorationcolor
            color = "#ffc87f";
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesborderenable
          enable = false;

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutborderinactive
          inactive = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#decorationcolor
            color = "#505050";
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutborderurgen
          urgent = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#decorationcolor
            color = "#9b0000";
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesborderwidth
          width = 4;
        };

        center-focused-column = "never";

        default-column-width = {
          proportion = 0.5;
        };

        # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutfocus-ring
        focus-ring = {
          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#decoration
          active = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#decorationcolor
            color = "#7fc8ff";
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutfocus-ringenable
          enable = true;

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#decoration
          inactive = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#decorationcolor
            color = "#505050";
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutfocus-ringwidth
          width = 4;
        };

        # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutgaps
        gaps = 16;

        # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutpreset-column-widths
        preset-column-widths = [
          {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutpreset-window-heightsproportion
            proportion = 0.33333;
          }

          {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutpreset-window-heightsproportion
            proportion = 0.5;
          }

          {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutpreset-window-heightsproportion
            proportion = 0.66667;
          }
        ];

        shadow = {
          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutshadowcolor
          color = "#0007";

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutshadowoffset
          offset = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutshadowoffsetx
            x = 0;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutshadowoffsety
            y = 5;
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutshadowsoftness
          softness = 30;

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingslayoutshadowspread
          spread = 5;
        };
      };

      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputs
      outputs = {
        HDMI-A-1 = {
          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamefocus-at-startup
          focus-at-startup = true;

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamemode
          mode = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamemodeheight
            height = 1080;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamemoderefresh
            # refresh = 60.000;
            refresh = 143.981;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamemodewidth
            width = 1920;
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnameposition
          position = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamepositionx
            x = 1920;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamepositiony
            y = 0;
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamescale
          scale = 1;
        };

        eDP-2 = {
          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamefocus-at-startup
          focus-at-startup = true;

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamemode
          mode = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamemodeheight
            height = 1080;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamemoderefresh
            refresh = 60.001;
            # refresh = 144.003;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamemodewidth
            width = 1920;
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnameposition
          position = {
            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamepositionx
            x = 0;

            # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamepositiony
            y = 0;
          };

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamescale
          scale = 1;

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoutputsnamevariable-refresh-rate
          variable-refresh-rate = "on-demand";
        };
      };

      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoverviewworkspace-shadowenable
      overview.workspace-shadow.enable = false;

      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsprefer-no-csd
      prefer-no-csd = true;

      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsscreenshot-path
      screenshot-path = "${config.home.homeDirectory}/Pictures/Screenshots/Screenshot from %Y-%m-%dT%H:%M:%S.png";

      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rules
      window-rules = [
        {
          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesmatches
          matches = [
            {
              # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesmatchesapp-id
              app-id = ''^org\.wezfurlong\.wezterm$'';
            }
          ];
        }

        {
          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesmatches
          matches = [
            {
              # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesmatchesapp-id
              app-id = ''firefox$'';

              # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesmatchestitle
              title = ''^Picture-in-Picture$'';
            }
          ];

          # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesopen-floating
          open-floating = true;
        }
      ];

      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsxwayland-satellite
      xwayland-satellite = {
        # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsxwayland-satelliteenable
        enable = true;

        # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsxwayland-satellitepath
        path = lib.getExe pkgs.xwayland-satellite-stable;
      };
    };

    # https://home-manager-options.extranix.com/?query=xdg.portal&release=master
    # https://yalter.github.io/niri/Important-Software.html#portals
    xdg.portal = {
      configPackages = [pkgs.niri-stable];

      enable = true;

      extraPortals = with pkgs; [
        gnome-keyring

        xdg-desktop-portal-gnome

        xdg-desktop-portal-gtk
      ];

      xdgOpenUsePortal = true;
    };
  };

  flake.modules.nixos.niri = {pkgs, ...}: {
    environment = {
      # # https://yalter.github.io/niri/Nvidia.html
      # etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text = builtins.toJSON {
      #   rules = [
      #     {
      #       pattern = {
      #         feature = "procname";

      #         matches = "niri";
      #       };

      #       profile = "Limit Free Buffer Pool On Wayland Compositors";
      #     }
      #   ];

      #   profiles = [
      #     {
      #       name = "Limit Free Buffer Pool On Wayland Compositors";

      #       settings = [
      #         {
      #           key = "GLVidHeapReuseRatio";

      #           value = 0;
      #         }
      #       ];
      #     }
      #   ];
      # };

      # https://yalter.github.io/niri/Important-Software.html#portals
      systemPackages = [pkgs.nautilus];
    };

    imports = [inputs.niri.nixosModules.niri];

    # https://github.com/sodiboo/niri-flake?tab=readme-ov-file#using-niri-unstable
    # https://github.com/sodiboo/niri-flake/blob/main/docs.md#overlaysniri
    nixpkgs.overlays = [inputs.niri.overlays.niri];

    # https://wiki.nixos.org/wiki/Niri#Configuration
    # https://github.com/YaLTeR/niri
    programs.niri = {
      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirienable
      enable = true;

      package = pkgs.niri-stable;
    };
  };
}
