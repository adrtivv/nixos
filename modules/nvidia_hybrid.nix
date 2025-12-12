{config, ...}: {
  flake.modules.nixos.nvidia_hybrid = {lib, ...}: {
    imports = [config.flake.modules.nixos.nvidia];

    # https://wiki.nixos.org/wiki/NVIDIA
    hardware.nvidia = {
      # https://wiki.nixos.org/wiki/NVIDIA#Graphical_corruption_and_system_crashes_on_suspend/resume
      powerManagement = {
        enable = true;

        finegrained = true;
      };

      # https://wiki.nixos.org/wiki/NVIDIA#Offload_mode
      prime.offload = {
        enable = true;

        enableOffloadCmd = true;
      };
    };

    # # Generates a custom nixos build that has the nvidia gpu always running.
    # specialization.nvidia_sync.configuration = {
    #   # https://wiki.nixos.org/wiki/NVIDIA
    #   hardware.nvidia = {
    #     # https://wiki.nixos.org/wiki/NVIDIA#Offload_mode
    #     prime.offload = {
    #       enable = lib.mkForce false;

    #       enableOffloadCmd = lib.mkForce false;
    #     };

    #     # # https://wiki.nixos.org/wiki/NVIDIA#Prime_mode
    #     prime.sync.enable = lib.mkForce true;
    #   };
    # };
  };
}
