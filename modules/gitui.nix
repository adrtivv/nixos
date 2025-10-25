{...}: {
  flake.modules.homeManager.gitui = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.gitui&release=master
    # https://github.com/extrawurst/gitui
    programs.gitui = {
      enable = true;
      # keyConfig = ''

      # '';
      # theme = ''
      #   (

      #   )
      # ''
    };
  };
}
