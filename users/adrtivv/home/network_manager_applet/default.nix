{
  lib,
  specialArgs,
  ...
}:
lib.mkIf specialArgs.host_programs.niri.enable
{
  # https://home-manager-options.extranix.com/?query=services.network-manager-applet&release=master
  services.network-manager-applet = {
    enable = true;
  };
}
