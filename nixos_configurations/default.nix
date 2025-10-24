{inputs, ...}: {
  flake.nixosConfigurations = {
    desktop = inputs.nixpkgs.lib.nixosSystem {
      modules = [./hosts/desktop.nix];
    };

    laptop = inputs.nixpkgs.lib.nixosSystem {
      modules = [./hosts/laptop.nix];
    };
  };
}
