{
  lib,
  pkgs,
  ...
}: {
  home.packages = [
    # https://search.nixos.org/packages?channel=unstable&show=brave&query=brave
    # https://github.com/brave/brave-browser
    (pkgs.brave.override
      {
        commandLineArgs = [
          (lib.concatStringsSep "," [
            "--enable-features=TouchpadOverscrollHistoryNavigation"
            "AcceleratedVideoEncoder"
          ])
          "--enable-zero-copy"
          "--ignore-gpu-blocklist"
        ];
      })
  ];
}
