# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  hostName,
  inputs,
  pkgs,
  userName,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # Bootloader
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  # https://wiki.nixos.org/wiki/Chromium#Enabling_native_Wayland_support
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware = {
    # https://wiki.nixos.org/wiki/Bluetooth#Setup
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
    # https://wiki.nixos.org/wiki/Accelerated_Video_Playback/en#AMD
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        # https://wiki.nixos.org/wiki/Accelerated_Video_Playback#NVIDIA
        libva-utils
      ];
    };
    # # https://wiki.nixos.org/wiki/Bluetooth#Using_Bluetooth_headsets_with_PulseAudio
    # pulseaudio.enable = true;
    # https://wiki.nixos.org/wiki/NVIDIA
    nvidia = {
      modesetting.enable = true;
      # https://wiki.nixos.org/wiki/NVIDIA#Kernel_modules_from_NVIDIA
      open = true;
      # # https://wiki.nixos.org/wiki/NVIDIA#Beta/production_branches
      # package = config.boot.kernelPackages.nvidiaPackages.beta;
      # package = config.boot.kernelPackages.nvidiaPackages.production;
      # https://wiki.nixos.org/wiki/NVIDIA#Graphical_corruption_and_system_crashes_on_suspend/resume
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      # # https://wiki.nixos.org/wiki/NVIDIA#Offload_mode
      prime = {
        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };

  # Select internationalisation properties.
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
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Since this file is hardware specific, there's no point tracking it through version control. Instead its default location on all nixos systems should be pointed towards as shown below so as to make this nixos configuration work on all compatible hardware.
    # /etc/nixos/hardware-configuration.nix
    inputs.sops_nix.nixosModules.sops
  ];

  networking = {
    # firewall = {
    #   # Open ports in the firewall.
    #   allowedTCPPorts = [ ... ];
    #   allowedUDPPorts = [ ... ];

    #   # Or disable the firewall altogether.
    #   enable = false;
    # };

    # Define your hostname.
    hostName = hostName;

    # Enable networking
    networkmanager.enable = true;

    # # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # }

    # # Enables wireless support via wpa_supplicant.
    # wireless.enable = true;
  };

  nix.optimise.automatic = true;

  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # https://wiki.nixos.org/wiki/Laptop#Power_management
  powerManagement.enable = true;

  programs = {
    # # https://wiki.nixos.org/wiki/Laptop#auto-cpufreq
    # # https://github.com/AdnanHodzic/auto-cpufreq
    # auto-cpufreq = {
    #   enable = true;
    #   settings = {
    #     battery = {
    #       # enable_thresholds = true;
    #       # energy_perf_bias = "balance_power";
    #       # energy_performance_preference = "power";
    #       governor = "powersave";
    #       # platform_profile = "low-power";
    #       # scaling_max_freq = "1000000";
    #       # scaling_min_freq = "800000";
    #       # start_threshold = "20";
    #       # stop_threshold = "80";
    #       turbo = "auto";
    #     };
    #     charger = {
    #       # energy_perf_bias = "balance_performance";
    #       # energy_performance_preference = "performance";
    #       governor = "performance";
    #       # platform_profile = "performance";
    #       # scaling_max_freq = "1000000";
    #       # scaling_min_freq = "800000";
    #       turbo = "auto";
    #     };
    #   };
    # };

    dconf.enable = true;

    # gamemode.enable = true;

    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # # Some programs need SUID wrappers, can be configured further or are started in user sessions.
    # mtr.enable = true;

    nano.enable = false;
  };

  security.rtkit.enable = true;

  # List services that you want to enable:
  services = {
    # Enable the KDE Plasma Desktop Environment.
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    flatpak.enable = true;
    fstrim.enable = true;

    # logind = {
    # Each field can have one of the following variants as values: "ignore", "poweroff", "reboot", "halt", "kexec", "suspend", "hibernate", "hybrid-sleep", "suspend-then-hibernate", "lock"
    # lidSwitch = "suspend";
    # lidSwitchDocked = "ignore";
    # lidSwitchExternalPower = "suspend";
    # };

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    pipewire = {
      alsa.enable = true;
      alsa.support32Bit = true;
      # Enable sound with pipewire.
      enable = true;
      pulse.enable = true;

      # # use the example session manager (no others are packaged yet so this is enabled by default, no need to redefine it in your config for now)
      # media-session.enable = true;
    };

    # https://gitlab.freedesktop.org/upower/power-profiles-daemon
    # power-profiles-daemon.enable = false;

    # Enable CUPS to print documents.
    printing.enable = true;

    xserver = {
      # # Enable touchpad support (enabled default in most desktopManager).
      # libinput.enable = true;

      videoDrivers = ["nvidia"];

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  sops = {
    age = {
      # Generate a new age private access key if it doesn't already exist.
      generateKey = true;
      # Path where the age private access key derived from host ssh private key is to be stored or an existing age private access key derived from the host ssh private key is to be found.
      keyFile = "/var/lib/sops-nix/keys.txt";
      # Path to the host ssh private key.
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    };
    # Path where the sops encrypted secrets are stored.
    defaultSopsFile = ../../secrets.yaml;
    # Attribute set of secrets that are to be decrypted and be made available at `/run/secrets`.
    secrets = {
      "users/${userName}/password_hash" = {
        # Normally sops-nix runs after the users are created on the system but this secret is required for user creation itself. This makes sops extract the decrypted secret to `/run/secrets-for-users` at system activation time.
        neededForUsers = true;
      };
    };
    validateSopsFiles = false;
  };

  # This value determines the NixOS release from which the default settings for stateful data, like file locations and database versions on your system were taken. It‘s perfectly fine and recommended to leave this value at the release version of the first install of this system. Before changing this value read the documentation for this option (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  users = {
    # This is required for sops to set the user password during the system activation. It also forces the user's password to only be controllable through this nix configuration.
    mutableUsers = false;
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.${userName} = {
      extraGroups = ["docker" "networkmanager" "wheel"];
      hashedPasswordFile = config.sops.secrets."users/${userName}/password_hash".path;
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        (builtins.readFile ../../users/${userName}/id_ed25519.pub)
      ];
    };
  };

  virtualisation.docker.enable = true;

  xdg.portal.enable = true;
}
