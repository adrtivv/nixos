{
  lib,
  pkgs,
  specialArgs,
  ...
}:
lib.mkIf specialArgs.host_programs.niri.enable
{
  home.packages = [
    # https://search.nixos.org/packages?channel=unstable&show=pavucontrol&query=pavucontrol
    # https://freedesktop.org/software/pulseaudio/pavucontrol/
    pkgs.pavucontrol
  ];
}
