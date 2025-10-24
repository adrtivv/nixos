{...}: {
  flake.homeModules.jujutsu = {
    email_address,
    user_name,
  }: {...}: {
    # https://home-manager-options.extranix.com/?query=programs.fd&release=master
    # https://github.com/jj-vcs/jj
    programs.jujutsu = {
      enable = true;

      settings = {
        # need to find if there's a way to add the comment below to the file using home manager
        #:schema https://jj-vcs.github.io/jj/latest/config-schema.json
        user = {
          email = email_address;

          name = user_name;
        };
      };
    };
  };
}
