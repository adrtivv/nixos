{...}: {
  flake.homeModules.ffmpeg = {pkgs, ...}: {
    # https://search.nixos.org/packages?channel=unstable&show=ffmpeg_8-full&query=ffmpeg_8-full
    # https://www.ffmpeg.org/
    home.packages = [pkgs.ffmpeg_8-full];
  };
}
