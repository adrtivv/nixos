{specialArgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.git&release=master
  # https://git-scm.com/
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";

      user = {
        email = specialArgs.email_address;

        name = specialArgs.user_name;
      };
    };
  };
}
