{ ... }:
{
  flake.modules.nixos.docker =
    {

      pkgs,
      ...
    }:
    {
      virtualisation.docker.enable = true;
    };
}
