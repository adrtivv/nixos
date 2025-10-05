{
  pkgs,
  specialArgs,
  ...
}: {
  # https://home-manager-options.extranix.com/?query=fonts&release=master
  fonts.fontconfig = {
    defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font Mono"];
      sansSerif = ["JetBrainsMono Nerd Font"];
      serif = ["JetBrainsMono Nerd Font"];
    };
    enable = true;
  };

  # https://home-manager-options.extranix.com/?query=home&release=master
  home = {
    homeDirectory = "/home/${specialArgs.userName}";

    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      brave
      ffmpeg
      file
      gparted
      kdlfmt
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
      obsidian
      # https://wiki.nixos.org/wiki/OpenRGB
      # https://search.nixos.org/options?channel=unstable&query=services.hardware.openrgb
      # openrgb
      qbittorrent
      swaybg
      tokei
      unrar
      vlc
      # https://yalter.github.io/niri/Important-Software.html#xwayland
      xwayland-satellite
      ytarchive
    ];

    # This value determines the home Manager release that your configuration is compatible with. This helps avoid breakage when a new home Manager release introduces backwards incompatible changes. You can update home Manager without changing this value. See the home Manager release notes for a list of state version changes in each release.
    stateVersion = "24.11";

    username = "${specialArgs.userName}";
  };

  imports = [
    ./bash
    ./bat
    ./bottom
    ./broot
    ./direnv
    ./easyeffects
    ./eza
    ./fastfetch
    ./fd
    ./firefox
    ./foliate
    ./fuzzel
    ./gh
    ./ghostty
    ./git
    ./gitui
    ./gnome_keyring
    ./helix
    ./home_manager
    ./jujutsu
    ./mpv
    ./niri
    ./nh
    ./plasma
    ./polkit_gnome
    ./ripgrep
    ./sops
    ./starship
    ./swayidle
    ./swaylock
    ./tealdeer
    ./zed_editor
    ./zen_browser
    ./zoxide
  ];

  # https://home-manager-options.extranix.com/?query=xdg.portal&release=master
  # https://yalter.github.io/niri/Important-Software.html#portals
  xdg.portal = {
    configPackages = [
      pkgs.gnome-session
    ];
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
