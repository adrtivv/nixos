{
  config,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.modules.nixos.hosts__laptop
    ];
  };
}
