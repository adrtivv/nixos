{ ... }:
{
  flake.modules.homeManager.starship =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.starship&release=master
      # https://starship.rs/
      programs.starship = {
        enable = true;

        enableZshIntegration = true;

        settings = {
          shlvl = {
            disabled = false;

            format = "\\[󰜴 $shlvl\\]($style) ";

            style = "bold mauve";

            threshold = 1;
          };
        };
      };
    };
}
