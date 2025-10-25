{...}: {
  flake.modules.homeManager.fd = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.fd&release=master
    # https://github.com/sharkdp/fd
    programs.fd = {
      enable = true;
    };
  };
}
