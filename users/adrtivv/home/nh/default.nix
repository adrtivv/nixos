{config, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.nh&release=master
  # https://github.com/nix-community/nh
  programs.nh = {
    clean = {
      enable = true;

      extraArgs = "--keep 3 --keep-since 4d";
    };

    enable = true;

    flake = "${config.home.homeDirectory}/nixos";
  };
}
