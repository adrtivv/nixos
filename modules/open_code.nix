{ inputs, ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { pkgs, ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.opencode&release=master
      # https://opencode.ai/docs
      programs.opencode = {
        enable = true;

        package = inputs.open_code.packages.${pkgs.stdenv.hostPlatform.system}.opencode;
      };
    };
}
