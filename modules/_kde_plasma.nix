{...}: {
  flake.modules.nixos.kde_plasma = {...}: {
    services.desktopManager.plasma6.enable = true;
  };
}
