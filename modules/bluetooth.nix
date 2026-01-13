{ ... }:
{
  flake.modules.nixos.bluetooth =
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
