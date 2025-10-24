{
  config,
  inputs,
  lib,
  self,
  ...
}: {
  flake.nixosModules.nvidia = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/NVIDIA
    nvidia = {
      modesetting.enable = lib.mkDefault true;

      # https://wiki.nixos.org/wiki/NVIDIA#Kernel_modules_from_NVIDIA
      open = lib.mkDefault true;

      # # https://wiki.nixos.org/wiki/NVIDIA#Beta/production_branches
      # package = config.boot.kernelPackages.nvidiaPackages.beta;
      # package = config.boot.kernelPackages.nvidiaPackages.production;

      # https://wiki.nixos.org/wiki/NVIDIA#Graphical_corruption_and_system_crashes_on_suspend/resume
      powerManagement = {
        enable = lib.mkDefault true;

        finegrained = lib.mkDefault true;
      };

      xserver.videoDrivers = ["nvidia"];
    };
  };
}
