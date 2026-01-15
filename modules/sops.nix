{ inputs, ... }:
{
  flake.modules.homeManager.users__adrtivv =
    {
      config,
      pkgs,
      ...
    }:
    {
      # https://search.nixos.org/packages?channel=unstable&show=sops&sort=alpha_asc&query=sops
      # https://getsops.io/
      home.packages = [ pkgs.sops ];

      # https://github.com/Mic92/sops-nix
      imports = [ inputs.sops_nix.homeManagerModules.sops ];

      sops = {
        # Path to where the age private key is to be derived and stored at or an existing age private key is to be found.
        age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";

        # Path to where the sops age encrypted secrets can be accessed.
        defaultSopsFile = ../secrets.yaml;

        validateSopsFiles = false;
      };
    };

  flake.modules.nixos.hosts__laptop =
    { lib, ... }:
    {
      imports = [ inputs.sops_nix.nixosModules.sops ];

      sops = {
        age = {
          # Generate a new age private access key if it doesn't already exist.
          generateKey = true;

          # Path where the age private access key derived from host ssh private key is to be stored or an existing age private access key derived from the host ssh private key is to be found.
          keyFile = "/var/lib/sops-nix/keys.txt";

          # Path to the host ssh private key.
          sshKeyPaths = lib.mkBefore [ "/etc/ssh/ssh_host_ed25519_key" ];
        };

        # Path where the sops encrypted secrets are stored.
        defaultSopsFile = ../secrets.yaml;

        validateSopsFiles = false;
      };
    };
}
