{...}: {
  # https://home-manager-options.extranix.com/?query=programs.direnv&release=master
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
