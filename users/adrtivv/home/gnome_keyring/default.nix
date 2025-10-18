{...}: {
  # https://home-manager-options.extranix.com/?query=gnome-keyring&release=master
  # https://yalter.github.io/niri/Important-Software.html#portals
  # https://gitlab.gnome.org/GNOME/gnome-keyring
  services.gnome-keyring = {
    enable = true;
  };
}
