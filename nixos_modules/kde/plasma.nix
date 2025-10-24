{
  config,
  inputs,
  lib,
  self,
  ...
}: {
  flake.nixosModules.kde_plasma = {pkgs, ...}: {
    services = {
      desktopManager.plasma6.enable = true;
    };
  };
}
