{...}: {
  # https://nix.catppuccin.com/options/main/home/catppuccin.swaync/#catppuccin-swaync.enable
  catppuccin.swaync = {
    font = "JetBrainsMono Nerd Font";
  };

  # https://home-manager-options.extranix.com/?query=swaync&release=master
  # https://yalter.github.io/niri/Important-Software.html#notification-daemon
  # https://github.com/ErikReider/SwayNotificationCenter
  services.swaync = {
    enable = true;
  };
}
