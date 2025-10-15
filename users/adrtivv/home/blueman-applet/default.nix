{
  lib,
  specialArgs,
  ...
}:
lib.mkIf specialArgs.host_programs.niri.enable
{
  # https://home-manager-options.extranix.com/?query=services.blueman-applet&release=master
  # https://github.com/blueman-project/blueman
  services.blueman-applet = {
    enable = true;
  };
}
