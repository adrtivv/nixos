{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}: {
  imports = [
    specialArgs.inputs.niri.homeModules.niri
  ];

  # xdg.configFile."niri" = {
  #   recursive = true;

  #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/users/adrtivv/home/niri/.config/";
  # };
}
