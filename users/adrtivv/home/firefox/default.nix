{pkgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.firefox&release=master
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [pkgs.vdhcoapp];
  };
}
