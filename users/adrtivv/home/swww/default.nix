{
  config,
  lib,
  specialArgs,
  ...
}:
lib.mkIf specialArgs.host_programs.niri.enable
{
  # https://home-manager-options.extranix.com/?query=services.swww&release=master
  # https://github.com/LGFae/swww
  services.swww = {
    enable = true;
  };
}
