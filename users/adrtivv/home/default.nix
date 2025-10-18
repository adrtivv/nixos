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
    homeDirectory = "/home/${specialArgs.user_name}";

    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      # https://search.nixos.org/packages?channel=unstable&show=brave&query=brave
      # https://github.com/brave/brave-browser
      brave

      # https://search.nixos.org/packages?channel=unstable&show=ffmpeg&query=ffmpeg
      # https://www.ffmpeg.org/
      ffmpeg

      # https://search.nixos.org/packages?channel=unstable&show=file&query=file
      # https://darwinsys.com/file/
      file

      # https://search.nixos.org/packages?channel=unstable&show=gparted&query=gparted
      gparted

      # https://search.nixos.org/packages?channel=unstable&show=killall&query=killall
      killall

      # https://search.nixos.org/packages?channel=unstable&show=nerd-fonts.jetbrains-mono&query=nerd-fonts.jetbrains-mono
      # https://www.nerdfonts.com/
      nerd-fonts.jetbrains-mono

      # https://search.nixos.org/packages?channel=unstable&show=noto-fonts-emoji&query=noto-fonts-emoji
      noto-fonts-emoji

      # https://search.nixos.org/packages?channel=unstable&show=obsidian&query=obsidian
      # https://obsidian.md/
      obsidian

      # https://wiki.nixos.org/wiki/OpenRGB
      # https://search.nixos.org/packages?channel=unstable&show=openrgb&query=openrgb
      # https://gitlab.com/CalcProgrammer1/OpenRGB
      openrgb

      # https://search.nixos.org/packages?channel=unstable&show=qbittorrent&query=qbittorrent
      # https://github.com/qbittorrent/qBittorrent
      qbittorrent

      # https://search.nixos.org/packages?channel=unstable&show=tokei&query=tokei
      # https://github.com/XAMPPRocky/tokei
      tokei

      # https://search.nixos.org/packages?channel=unstable&show=unrar&query=unrar
      # https://www.rarlab.com/
      unrar

      # https://search.nixos.org/packages?channel=unstable&show=vlc&query=vlc
      # https://www.videolan.org/vlc/
      vlc

      # https://search.nixos.org/packages?channel=unstable&show=ytarchive&query=ytarchive
      # https://github.com/Kethsar/ytarchive
      ytarchive
    ];

    # This value determines the home Manager release that your configuration is compatible with. This helps avoid breakage when a new home Manager release introduces backwards incompatible changes. You can update home Manager without changing this value. See the home Manager release notes for a list of state version changes in each release.
    stateVersion = "24.11";

    username = "${specialArgs.user_name}";
  };

  imports = [
    ./bash

    ./bat

    # ./blueman-applet

    ./bottom

    # ./brightnessctl

    ./broot

    ./catppuccin

    # ./dank_material_shell

    ./direnv

    ./easyeffects

    # ./eww

    ./eza

    ./fastfetch

    ./fd

    ./firefox

    ./foliate

    ./gh

    ./ghostty

    ./git

    ./gitui

    # ./gnome_keyring

    ./helix

    ./home_manager

    # ./ironbar

    ./jujutsu

    ./mpv

    # ./network_manager_applet

    ./nh

    ./niri

    ./plasma

    # ./polkit_gnome

    ./ripgrep

    ./sops

    ./starship

    # ./swayidle

    # ./swaylock

    # ./swaync

    # ./swayosd

    # ./swww

    ./tealdeer

    # ./walker

    # ./waybar

    # ./wleave

    # ./wluma

    ./zed_editor

    ./zen_browser

    ./zoxide
  ];

  # https://home-manager-options.extranix.com/?query=xdg.portal&release=master
  # https://yalter.github.io/niri/Important-Software.html#portals
  # xdg.portal = {
  #   enable = true;

  #   xdgOpenUsePortal = true;
  # };
}
