{config, ...}: let
  common = {pkgs, ...}: {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;

      # Bootloader
      loader = {
        efi.canTouchEfiVariables = true;

        systemd-boot.enable = true;
      };
    };

    environment = {
      # # https://home-manager-options.extranix.com/?query=xdg.portal.enable&release=master
      # pathsToLink = ["/share/xdg-desktop-portal" "/share/applications"];

      # https://wiki.nixos.org/wiki/Chromium#Enabling_native_Wayland_support
      sessionVariables.NIXOS_OZONE_WL = "1";
    };

    hardware.graphics = {
      # https://wiki.nixos.org/wiki/Accelerated_Video_Playback/en#AMD
      enable = true;

      enable32Bit = true;
    };

    i18n = {
      defaultLocale = "en_IN";

      extraLocaleSettings = {
        LC_ADDRESS = "en_IN";

        LC_IDENTIFICATION = "en_IN";

        LC_MEASUREMENT = "en_IN";

        LC_MONETARY = "en_IN";

        LC_NAME = "en_IN";

        LC_NUMERIC = "en_IN";

        LC_PAPER = "en_IN";

        LC_TELEPHONE = "en_IN";

        LC_TIME = "en_IN";
      };
    };

    imports = [
      config.flake.modules.nixos.backlight

      config.flake.modules.nixos.catppuccin

      # config.flake.modules.nixos.docker

      config.flake.modules.nixos.gaming

      config.flake.modules.nixos.home_manager

      config.flake.modules.nixos.kde_plasma

      config.flake.modules.nixos.niri

      config.flake.modules.nixos.users__adrtivv
    ];

    networking.networkmanager.enable = true;

    nix = {
      optimise.automatic = true;

      settings = {
        experimental-features = [
          "flakes"

          "nix-command"
        ];
      };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    programs = {
      dconf.enable = true;

      nano.enable = false;
    };

    security = {
      rtkit.enable = true;
    };

    services = {
      displayManager.sddm.enable = true;

      flatpak.enable = true;

      fstrim.enable = true;

      openssh.enable = true;

      pipewire = {
        alsa.enable = true;

        alsa.support32Bit = true;

        # Enable sound with pipewire.
        enable = true;

        pulse.enable = true;
      };

      xserver = {
        xkb = {
          layout = "us";

          variant = "";
        };
      };
    };

    # This value determines the NixOS release from which the default settings for stateful data, like file locations and database versions on your system were taken. It‘s perfectly fine and recommended to leave this value at the release version of the first install of this system. Before changing this value read the documentation for this option (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?

    time.timeZone = "Asia/Kolkata";
  };
in {
  flake.modules.nixos.hosts__desktop = {...}: {
    imports = [
      common

      config.flake.modules.nixos.nvidia

      # config.flake.modules.nixos.users__anon
    ];

    networking.hostName = "desktop";
  };

  flake.modules.nixos.hosts__laptop = {...}: {
    # https://wiki.nixos.org/wiki/NVIDIA
    hardware.nvidia = {
      # https://wiki.nixos.org/wiki/NVIDIA#Offload_mode
      prime = {
        amdgpuBusId = "PCI:6:0:0";

        nvidiaBusId = "PCI:1:0:0";
      };
    };

    imports = [
      common

      config.flake.modules.nixos.bluetooth

      config.flake.modules.nixos.nvidia_hybrid
    ];

    # # https://wiki.nixos.org/wiki/Laptop#Power_management
    # powerManagement.enable = true;

    networking.hostName = "laptop";

    services = {
      # Enable touchpad support (enabled by default in most desktop environments.).
      libinput.enable = true;

      # logind = {
      # Each field can have one of the following variants as values: "ignore", "poweroff", "reboot", "halt", "kexec", "suspend", "hibernate", "hybrid-sleep", "suspend-then-hibernate", "lock"
      # lidSwitch = "suspend";

      # lidSwitchDocked = "ignore";

      # lidSwitchExternalPower = "suspend";
      # };
    };
  };
}
