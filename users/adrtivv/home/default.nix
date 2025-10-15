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

      # https://search.nixos.org/packages?channel=unstable&show=ffmpeg_8-full&query=ffmpeg_8-full
      # https://www.ffmpeg.org/
      ffmpeg_8-full

      # https://search.nixos.org/packages?channel=unstable&show=file&query=file
      # https://darwinsys.com/file/
      file

      # https://search.nixos.org/packages?channel=unstable&show=gparted&query=gparted
      gparted

      # https://search.nixos.org/packages?channel=unstable&show=killall&query=killall
      killall

      # https://search.nixos.org/packages?channel=unstable&show=mpv&query=mpv
      mpv

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

    ./bottom

    ./broot

    ./catppuccin

    ./direnv

    ./easyeffects

    ./eza

    ./fastfetch

    ./fd

    ./firefox

    ./foliate

    ./gh

    ./ghostty

    ./git

    ./gitui

    ./helix

    ./home_manager

    ./jujutsu

    ./mpv

    ./nh

    ./niri

    ./plasma

    ./ripgrep

    ./sops

    ./starship

    ./tealdeer

    ./walker

    ./zed_editor

    ./zen_browser

    ./zoxide
  ];
}
