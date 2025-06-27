{...}: {
  programs.nh = {
    clean = {
      enable = true;
      extraArgs = "--keep 3 --keep-since 4d";
    };
    enable = true;
    flake = "/home/adrtivv/nixos";
  };
}
