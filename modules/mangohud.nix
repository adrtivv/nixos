{ ... }:
{
  flake.modules.homeManager.users__adrtivv =
    { ... }:
    {
      # https://home-manager-options.extranix.com/?query=programs.mangohud&release=master
      programs.mangohud = {
        enable = true;

        settings = {
          cpu_temp = 1;

          gpu_temp = 1;

          gpu_junction_temp = 1;

          gpu_mem_temp = 1;
        };
      };
    };

  flake.modules.nixos.hosts__laptop =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        mangohud
      ];
    };
}
