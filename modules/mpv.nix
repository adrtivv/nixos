{...}: {
  flake.modules.homeManager.mpv = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.mpv&release=master
    # https://mpv.io/
    programs.mpv = {
      enable = true;
    };
  };
}
