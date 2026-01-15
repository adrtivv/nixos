{ ... }:
{
  flake.modules.nixos.hosts__laptop =
    {
      ...
    }:
    {
      # users = {
      #   users.${user_name} = {
      #     extraGroups = [
      #       # "docker"

      #     ];
      #   };
      # };

      virtualisation.docker.enable = true;
    };
}
