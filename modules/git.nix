{...}: {
  flake.modules.homeManager.git = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.git&release=master
    # https://git-scm.com/
    programs.git = {
      enable = true;

      settings.init.defaultBranch = "main";
    };
  };
}
