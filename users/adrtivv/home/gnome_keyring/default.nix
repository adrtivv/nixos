{
  config,
  lib,
  specialArgs,
  ...
}:
lib.mkIf specialArgs.host_programs.niri.enable
{
  # https://home-manager-options.extranix.com/?query=gnome-keyring&release=master
  # https://yalter.github.io/niri/Important-Software.html#portals
  # https://gitlab.gnome.org/GNOME/gnome-keyring
  services.gnome-keyring = {
    enable = true;
  };
}
