{...}: {
  flake.modules.homeManager.bottom = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.bottom&release=master
    # https://github.com/ClementTsang/bottom
    programs.bottom = {
      enable = true;
    };
  };
}
