{ ... }:
{
  flake.modules.nixos.hosts__laptop =
    { pkgs, ... }:
    {
      hardware.i2c.enable = true;

      services.udev.packages = [ pkgs.ddcutil ];
    };
}
