{specialArgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.git&release=master
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
    userEmail = specialArgs.emailAddress;
    userName = specialArgs.userName;
  };
}
