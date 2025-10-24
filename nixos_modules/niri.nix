{inputs, ...}: {
  flake.nixosModules.niri = {pkgs, ...}: {
    environment = {
      # # https://yalter.github.io/niri/Nvidia.html
      # etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text = builtins.toJSON {
      #   rules = [
      #     {
      #       pattern = {
      #         feature = "procname";

      #         matches = "niri";
      #       };

      #       profile = "Limit Free Buffer Pool On Wayland Compositors";
      #     }
      #   ];

      #   profiles = [
      #     {
      #       name = "Limit Free Buffer Pool On Wayland Compositors";

      #       settings = [
      #         {
      #           key = "GLVidHeapReuseRatio";

      #           value = 0;
      #         }
      #       ];
      #     }
      #   ];
      # };
    };

    imports = [inputs.niri.nixosModules.niri];

    # https://github.com/sodiboo/niri-flake?tab=readme-ov-file#using-niri-unstable
    # https://github.com/sodiboo/niri-flake/blob/main/docs.md#overlaysniri
    nixpkgs.overlays = [inputs.niri.overlays.niri];

    # https://wiki.nixos.org/wiki/Niri#Configuration
    # https://github.com/YaLTeR/niri
    programs.niri = {
      # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirienable
      enable = true;

      package = pkgs.niri-stable;
    };
  };
}
