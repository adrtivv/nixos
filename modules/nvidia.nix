{lib, ...}: {
  flake.modules.nixos.nvidia = {
    # https://wiki.nixos.org/wiki/NVIDIA
    hardware.nvidia = {
      modesetting.enable = true;

      # https://wiki.nixos.org/wiki/NVIDIA#Kernel_modules_from_NVIDIA
      open = true;

      # # https://wiki.nixos.org/wiki/NVIDIA#Beta/production_branches
      # package = config.boot.kernelPackages.nvidiaPackages.beta;
      # package = config.boot.kernelPackages.nvidiaPackages.production;
    };

    services.xserver.videoDrivers = lib.mkBefore ["nvidia"];
  };
}
