{...}: {
  flake.modules.homeManager.bash = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.bash&release=master
    # https://www.gnu.org/software/bash/

    programs.bash = {
      enable = true;

      enableCompletion = true;
    };
  };
}
