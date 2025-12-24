{...}: {
  flake.modules.homeManager.fonts = {pkgs, ...}: {
    # https://home-manager-options.extranix.com/?query=fonts&release=master
    fonts.fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoji"];

        monospace = [
          "JetBrainsMono Nerd Font Mono"

          "Noto Sans Mono"
        ];

        sansSerif = [
          "JetBrainsMono Nerd Font"

          "Noto Sans"

          "Noto Sans CJK SC"
        ];

        serif = [
          "JetBrainsMono Nerd Font"

          "Noto Serif"

          "Noto Serif CJK SC"
        ];
      };

      enable = true;
    };

    home.packages = with pkgs; [
      # https://search.nixos.org/packages?channel=unstable&show=nerd-fonts.jetbrains-mono&query=nerd-fonts.jetbrains-mono
      # https://www.nerdfonts.com/
      nerd-fonts.jetbrains-mono

      noto-fonts

      noto-fonts-cjk-sans

      noto-fonts-cjk-serif

      # https://search.nixos.org/packages?channel=unstable&show=noto-fonts-emoji&query=noto-fonts-emoji
      noto-fonts-color-emoji
    ];
  };
}
