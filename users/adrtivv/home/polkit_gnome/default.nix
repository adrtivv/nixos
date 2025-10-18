{...}: {
  # https://home-manager-options.extranix.com/?query=services.polkit-gnome&release=master
  # https://yalter.github.io/niri/Important-Software.html#portals
  # https://gitlab.gnome.org/Archive/policykit-gnome
  services.polkit-gnome = {
    enable = true;
  };
}
