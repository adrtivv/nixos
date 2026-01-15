{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.fd&release=master
      # https://github.com/jj-vcs/jj
      programs.jujutsu = {
        enable = true;

        # need to find if there's a way to add the comment below to the file using home manager
        # :schema https://jj-vcs.github.io/jj/latest/config-schema.json
        settings.user = {
          email = "adrtivv@gmail.com";

          name = "adrtivv";
        };
      };
    };
}
