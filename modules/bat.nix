{...}: {
  flake.modules.homeManager.bat = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.bat&release=master
    # https://github.com/sharkdp/bat
    programs.bat = {
      enable = true;
    };
  };
}
