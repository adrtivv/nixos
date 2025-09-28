{specialArgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.fd&release=master
  programs.jujutsu = {
    enable = true;
    settings = {
      # need to find if there's a way to add the comment below to the file using home manager
      #:schema https://jj-vcs.github.io/jj/latest/config-schema.json
      user = {
        email = specialArgs.emailAddress;
        name = specialArgs.userName;
      };
    };
  };
}
