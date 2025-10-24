{
  config,
  inputs,
  lib,
  self,
  ...
}: {
  flake.nixosModules.bluetooth = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/Bluetooth#Setup
    bluetooth = {
      enable = lib.mkDefault true;

      settings = {
        General = {
          Experimental = lib.mkDefault true;
        };
      };
    };
  };
}
