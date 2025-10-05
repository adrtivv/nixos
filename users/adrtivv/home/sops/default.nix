{
  config,
  pkgs,
  specialArgs,
  ...
}: {
  home.packages = [
    pkgs.sops
  ];

  imports = [
    specialArgs.inputs.sops_nix.homeManagerModules.sops
  ];

  sops = {
    # Path to where the age private key is to be derived and stored at or an existing age private key is to be found.
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    # Path to where the sops age encrypted secrets can be accessed.
    defaultSopsFile = ../../../../secrets.yaml;
    secrets = {
      "users/${specialArgs.userName}/id_ed25519" = {
        path = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };
    };
    validateSopsFiles = false;
  };
}
