{
  config,
  inputs,
  lib,
  self,
  ...
}: {
  flake.nixosModules.common = {pkgs, ...}: {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;

      # Bootloader
      loader = {
        efi.canTouchEfiVariables = true;

        systemd-boot.enable = true;
      };
    };

    environment = {
      # https://wiki.nixos.org/wiki/Chromium#Enabling_native_Wayland_support
      sessionVariables.NIXOS_OZONE_WL = "1";
    };

    nix = {
      optimise.automatic = true;

      settings = {
        experimental-features = [
          "flakes"

          "nix-command"
        ];
      };
    };

    nixpkgs.config.allowUnfree = true;

    programs = {
      nano.enable = lib.mkDefault false;
    };

    services = {
      flatpak.enable = true;

      fstrim.enable = true;

      pipewire = {
        alsa.enable = true;

        alsa.support32Bit = true;

        # Enable sound with pipewire.
        enable = true;

        pulse.enable = true;
      };
    };

    time.timeZone = "Asia/Kolkata";
  };
}
