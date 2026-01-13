{
  config,
  inputs,
  ...
}:
{
  flake.nixosConfigurations = {
    desktop = inputs.nixpkgs.lib.nixosSystem {
      modules = [ config.flake.modules.nixos.hosts__desktop ];
    };

    laptop = inputs.nixpkgs.lib.nixosSystem {
      modules = [ config.flake.modules.nixos.hosts__laptop ];
    };
  };
}
