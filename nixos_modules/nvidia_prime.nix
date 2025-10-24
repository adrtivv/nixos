{
  config,
  inputs,
  lib,
  self,
  ...
}: {
  flake.nixosModules.nvidia_prime = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/NVIDIA
    nvidia = {
      imports = [self.nixosModules.nvidia];

      # https://wiki.nixos.org/wiki/NVIDIA#Offload_mode
      prime = {
        offload = {
          enable = true;

          enableOffloadCmd = lib.mkDefault true;
        };
      };
    };
  };
}
