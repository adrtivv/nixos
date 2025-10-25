{...}: {
  flake.modules.homeManager.fonts = {pkgs, ...}: {
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

    home.packages = with pkgs; [
      # https://search.nixos.org/packages?channel=unstable&show=nerd-fonts.jetbrains-mono&query=nerd-fonts.jetbrains-mono
      # https://www.nerdfonts.com/
      nerd-fonts.jetbrains-mono

      # https://search.nixos.org/packages?channel=unstable&show=noto-fonts-emoji&query=noto-fonts-emoji
      noto-fonts-emoji
    ];
  };
}
