{
  config,
  inputs,
  lib,
  self,
  ...
}: {
  flake.nixosModules.i18n = {pkgs, ...}: {
    i18n = {
      defaultLocale = lib.mkDefault "en_IN";

      extraLocaleSettings = {
        LC_ADDRESS = lib.mkDefault "en_IN";

        LC_IDENTIFICATION = lib.mkDefault "en_IN";

        LC_MEASUREMENT = lib.mkDefault "en_IN";

        LC_MONETARY = lib.mkDefault "en_IN";

        LC_NAME = lib.mkDefault "en_IN";

        LC_NUMERIC = lib.mkDefault "en_IN";

        LC_PAPER = lib.mkDefault "en_IN";

        LC_TELEPHONE = lib.mkDefault "en_IN";

        LC_TIME = lib.mkDefault "en_IN";
      };
    };
  };
}
