{self, ...}: {
  flake.homeModules.fonts = {pkgs, ...}: {
    fonts.fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoji"];

        monospace = ["JetBrainsMono Nerd Font Mono"];

        sansSerif = ["JetBrainsMono Nerd Font"];

        serif = ["JetBrainsMono Nerd Font"];
      };

      enable = true;
    };

    home.packages = with pkgs; [
      # https://search.nixos.org/packages?channel=unstable&show=noto-fonts-emoji&query=noto-fonts-emoji
      noto-fonts-emoji
    ];

    imports = [
      self.homeModules.jet_brains_mono_nerd_font
    ];
  };
}
