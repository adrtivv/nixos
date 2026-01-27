{ ... }:
{
  flake.templates = {
    nix = {
      description = "Nix flake template for setting up a nix environment.";

      path = ./_nix;
    };

    node = {
      description = "Nix flake template for a setting up node.js environment.";

      path = ./_node;
    };

    rust = {
      description = "Nix flake template for setting up a rust environment.";

      path = ./_rust;
    };
  };
}
