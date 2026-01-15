{ ... }:
{
  flake.modules.nixos.hosts__laptop =
    { ... }:
    {
      programs.gamemode.enable = true;
    };
}
