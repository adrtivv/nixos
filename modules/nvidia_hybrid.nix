{config, ...}: {
  flake.modules.nixos.nvidia_hybrid = {
    imports = [config.flake.modules.nixos.nvidia];

    # https://wiki.nixos.org/wiki/NVIDIA
    hardware.nvidia = {
      # https://wiki.nixos.org/wiki/NVIDIA#Graphical_corruption_and_system_crashes_on_suspend/resume
      powerManagement = {
        # enable = true;

        # finegrained = true;
      };

      # # https://wiki.nixos.org/wiki/NVIDIA#Offload_mode
      prime.offload = {
        enable = true;

        enableOffloadCmd = true;
      };
    };
  };
}
