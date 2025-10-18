{config, ...}: {
  # https://nix.catppuccin.com/options/main/home/catppuccin.waybar/#catppuccin-waybar.enable
  catppuccin.waybar = {
    # https://nix.catppuccin.com/options/main/home/catppuccin.waybar/#catppuccin-waybar.enable
    enable = false;

    # https://nix.catppuccin.com/options/main/home/catppuccin.waybar/#catppuccin-waybar.mode
    mode = "prependImport";
  };

  # https://home-manager-options.extranix.com/?query=programs.waybar&release=master
  # https://github.com/Alexays/Waybar
  programs.waybar = {
    enable = true;

    # settings = {};

    systemd.enable = true;
  };

  # systemd.user.services.waybar = {
  #   Install.WantedBy = ["niri.service"];
  # };

  xdg.configFile."waybar" = {
    recursive = true;

    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/users/adrtivv/home/waybar/.config/";
  };
}
