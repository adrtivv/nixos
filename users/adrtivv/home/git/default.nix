{specialArgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.git&release=master
  # https://git-scm.com/
  programs.git = {
    enable = true;

    extraConfig = {
      init.defaultBranch = "main";
    };

    userEmail = specialArgs.email_address;

    userName = specialArgs.user_name;
  };
}
