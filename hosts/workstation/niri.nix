{pkgs, ...}: {
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

    systemPackages = with pkgs; [
      bluez

      ddcutil

      kdePackages.dolphin

      # https://yalter.github.io/niri/Important-Software.html#xwayland
      # https://search.nixos.org/packages?channel=unstable&show=xwayland-satellite&query=xwayland-satellite
      # https://github.com/Supreeeme/xwayland-satellite
      xwayland-satellite
    ];
  };

  # https://wiki.nixos.org/wiki/Niri#Configuration
  # https://github.com/YaLTeR/niri
  programs.niri.enable = true;

  services = {
    # Enable touchpad support (enabled by default in most desktop environements.).
    libinput.enable = true;

    # logind = {
    # Each field can have one of the following variants as values: "ignore", "poweroff", "reboot", "halt", "kexec", "suspend", "hibernate", "hybrid-sleep", "suspend-then-hibernate", "lock"
    # lidSwitch = "suspend";

    # lidSwitchDocked = "ignore";

    # lidSwitchExternalPower = "suspend";
    # };

    udev.packages = [pkgs.ddcutil];
  };
}
