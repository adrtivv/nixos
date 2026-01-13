{ ... }:
{
  flake.templates = {
    nix = {
      description = "";

      path = ./nix;
    };

    node = {
      description = "";

      path = ./node;
    };

    rust = {
      description = "";

      path = ./rust;
    };
  };
}
