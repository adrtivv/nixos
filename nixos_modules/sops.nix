{
  config,
  inputs,
  ...
}: {
  flake.nixosModules.sops = {
    keys,
    user_name,
    ...
  }: {...}: {
    imports = [
      inputs.sops_nix.nixosModules.sops
    ];

    sops = {
      age = {
        # Generate a new age private access key if it doesn't already exist.
        generateKey = true;

        # Path where the age private access key derived from host ssh private key is to be stored or an existing age private access key derived from the host ssh private key is to be found.
        keyFile = "/var/lib/sops-nix/keys.txt";

        # Path to the host ssh private key.
        sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      };

      # Path where the sops encrypted secrets are stored.
      defaultSopsFile = ../secrets.yaml;

      # Attribute set of secrets that are to be decrypted and be made available at `/run/secrets`.
      secrets = {
        "users/${user_name}/password_hash" = {
          # Normally sops-nix runs after the users are created on the system but this secret is required for user creation itself. This makes sops extract the decrypted secret to `/run/secrets-for-users` at system activation time.
          neededForUsers = true;
        };
      };

      validateSopsFiles = false;
    };

    users = {
      # This is required for sops to set the user password during the system activation. It also forces the user's password to only be controllable through this nix configuration.
      mutableUsers = false;

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.${user_name} = {
        extraGroups = [
          "docker"

          "networkmanager"

          "wheel"
        ];

        hashedPasswordFile = config.sops.secrets."users/${user_name}/password_hash".path;

        isNormalUser = true;

        openssh.authorizedKeys.keys = keys;
      };
    };
  };
}
