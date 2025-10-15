{
  lib,
  pkgs,
  specialArgs,
  ...
}:
lib.mkIf specialArgs.host_programs.niri.enable
{
  home.packages = [
    # https://search.nixos.org/packages?channel=unstable&show=wvkbd&query=wvkbd
    # https://github.com/jjsullivan5196/wvkbd
    pkgs.pavucontrol
  ];
}
