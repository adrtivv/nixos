{ ... }:
{
  flake.modules.nixos.hosts__laptop =
    { ... }:
    {
      # https://wiki.nixos.org/wiki/Bluetooth#Setup
      hardware.bluetooth = {
        enable = true;

        settings = {
          General = {
            Experimental = true;
          };
        };
      };
    };
}
