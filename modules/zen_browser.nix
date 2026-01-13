{ inputs, ... }:
{
  flake.modules.homeManager.zen_browser =
    { pkgs, ... }:
    {
      home.packages = [
        # https://github.com/0xc000022070/zen-browser-flake
        inputs.zen_browser.packages."${pkgs.stdenv.hostPlatform.system}".default
        # specialArgs.inputs.zen_browser.packages.${pkgs.stdenv.hostPlatform.system}.default.override
        # {
        #   # https://github.com/aclap-dev/vdhcoapp/issues/247
        #   # nativeMessagingHosts = [pkgs.vdhcoapp];

        #   policies = let
        #     mkLockedAttrs = builtins.mapAttrs (_: value: {
        #       Status = "locked";

        #       Value = value;

        #     });

        #   in {
        #     Preferences = mkLockedAttrs {
        #       # https://wiki.nixos.org/wiki/Accelerated_Video_Playback#NVIDIA
        #       # gfx.x11-egl.force-enabled = true;

        #       # media.av1.enabled = true;

        #       # media.hardware-video-decoding.force-enabled = true;

        #       # https://yalter.github.io/niri/Application-Issues.html#zen-browser
        #       widget.dmabuf.force-enabled = true;

        #     };

        #   };

        # }
      ];
    };
}
