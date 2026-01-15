{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.protonup-rs ];
    };
}
