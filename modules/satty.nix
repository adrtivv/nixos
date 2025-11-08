{...}: {
  flake.modules.homeManager.satty = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.satty&release=master
    # https://github.com/Satty-org/Satty
    programs.satty = {
      enable = true;

      settings = {
        general = {
          fullscreen = true;
        };
      };
    };
  };
}
