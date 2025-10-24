{...}: {
  flake.homeModules.jet_brains_mono_nerd_font = {pkgs, ...}: {
    home.packages = [
      # https://search.nixos.org/packages?channel=unstable&show=nerd-fonts.jetbrains-mono&query=nerd-fonts.jetbrains-mono
      # https://www.nerdfonts.com/
      pkgs.nerd-fonts.jetbrains-mono
    ];
  };
}
