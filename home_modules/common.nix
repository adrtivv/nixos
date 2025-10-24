{self, ...}: {
  flake.homeModules.common = {user_name}: {...}: {
    imports = [
      self.homeModules.bash

      self.homeModules.bat

      self.homeModules.bottom

      self.homeModules.broot

      self.homeModules.catppuccin

      self.homeModules.direnv

      self.homeModules.easy_effects

      self.homeModules.eza

      self.homeModules.fast_fetch

      self.homeModules.fd

      self.homeModules.ffmpeg

      self.homeModules.file

      self.homeModules.fonts

      self.homeModules.ghostty

      self.homeModules.gparted

      self.homeModules.helix

      self.homeModules.home_manager

      self.homeModules.jet_brains_mono_nerd_font

      self.homeModules.kde_plasma

      self.homeModules.killall

      self.homeModules.mpv

      self.homeModules.nh

      self.homeModules.niri

      self.homeModules.obsidian

      self.homeModules.openrgb

      self.homeModules.qbittorrent

      self.homeModules.ripgrep

      self.homeModules.starship

      self.homeModules.tealdeer

      self.homeModules.tokei

      self.homeModules.unrar

      self.homeModules.vlc

      self.homeModules.ytarchive

      self.homeModules.zed_editor

      self.homeModules.zen_browser

      self.homeModules.zoxide
    ];

    home = {
      homeDirectory = "/home/${user_name}";

      # This value determines the home Manager release that your configuration is compatible with. This helps avoid breakage when a new home Manager release introduces backwards incompatible changes. You can update home Manager without changing this value. See the home Manager release notes for a list of state version changes in each release.
      stateVersion = "25.05";

      userName = user_name;
    };
  };
}
