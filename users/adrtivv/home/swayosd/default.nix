{
  config,
  lib,
  specialArgs,
  ...
}:
lib.mkIf specialArgs.host_programs.niri.enable
{
  # https://home-manager-options.extranix.com/?query=services.swayosd&release=master
  # https://github.com/ErikReider/SwayOSD
  services.swayosd = {
    enable = true;
  };
}
