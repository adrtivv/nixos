{...}: {
  flake.modules.nixos.backlight = {pkgs, ...}: {
    hardware.i2c.enable = true;

    services.udev.packages = [pkgs.ddcutil];
  };
}
