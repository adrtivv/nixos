{...}: {
  flake.homeModules.git = {
    email_address,
    user_name,
  }: {...}: {
    # https://home-manager-options.extranix.com/?query=programs.git&release=master
    # https://git-scm.com/
    programs.git = {
      enable = true;

      extraConfig = {
        init.defaultBranch = "main";
      };

      userEmail = email_address;

      userName = user_name;
    };
  };
}
