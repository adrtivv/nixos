{specialArgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.fd&release=master
  programs.jujutsu = {
    enable = true;
    settings = {
      email = specialArgs.emailAddress;
      name = specialArgs.userName;
    };
  };
}
