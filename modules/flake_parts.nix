{ inputs, ... }:
{
  debug = true;

  imports = [
    inputs.flake_parts.flakeModules.modules
  ];
}
