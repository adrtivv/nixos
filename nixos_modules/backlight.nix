{lib, ...}: {
  flake.nixosModules.backlight = {pkgs, ...}: {
    hardware.i2c.enable = lib.mkDefault true;

    services.udev.packages = [pkgs.ddcutil];
  };
}
