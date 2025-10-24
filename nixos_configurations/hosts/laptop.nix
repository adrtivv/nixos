{self, ...}: {
  environment = {
    # https://home-manager-options.extranix.com/?query=xdg.portal.enable&release=master
    pathsToLink = ["/share/xdg-desktop-portal" "/share/applications"];
  };

  hardware = {
    graphics = {
      # https://wiki.nixos.org/wiki/Accelerated_Video_Playback/en#AMD
      enable = true;

      enable32Bit = true;
    };

    # https://wiki.nixos.org/wiki/NVIDIA
    nvidia = {
      # # https://wiki.nixos.org/wiki/NVIDIA#Offload_mode
      prime = {
        amdgpuBusId = "PCI:6:0:0";

        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  imports = [
    self.nixosModules.backlight

    self.nixosModules.bluetooth

    self.nixosModules.catppuccin

    self.nixosModules.common

    self.nixosModules.i18n

    self.nixosModules.kde_plasma

    self.nixosModules.kde_plasma_home

    self.nixosModules.niri

    self.nixosModules.nvidia_prime

    # Since this file is hardware specific, there's no point tracking it through version control. Instead its default location on all nixos systems should be pointed towards as shown below so as to make this nixos configuration work on all compatible hardware.
    /etc/nixos/hardware-configuration.nix

    ../users/adrtivv.nix
  ];

  networking = {
    hostName = "laptop";

    networkmanager.enable = true;
  };

  # https://wiki.nixos.org/wiki/Laptop#Power_management
  powerManagement.enable = true;

  programs = {
    dconf.enable = true;
  };

  security = {
    rtkit.enable = true;
  };

  services = {
    displayManager.sddm.enable = true;

    # Enable touchpad support (enabled by default in most desktop environements.).
    libinput.enable = true;

    # logind = {
    # Each field can have one of the following variants as values: "ignore", "poweroff", "reboot", "halt", "kexec", "suspend", "hibernate", "hybrid-sleep", "suspend-then-hibernate", "lock"
    # lidSwitch = "suspend";

    # lidSwitchDocked = "ignore";

    # lidSwitchExternalPower = "suspend";
    # };

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    xserver = {
      videoDrivers = ["nvidia"];

      # Configure keymap in X11
      xkb = {
        layout = "us";

        variant = "";
      };
    };
  };

  # This value determines the NixOS release from which the default settings for stateful data, like file locations and database versions on your system were taken. It‘s perfectly fine and recommended to leave this value at the release version of the first install of this system. Before changing this value read the documentation for this option (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  virtualisation.docker.enable = true;
}
