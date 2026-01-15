{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=services.podman&release=master
      # https://github.com/containers/podman
      services.podman.enable = true;
    };
}
