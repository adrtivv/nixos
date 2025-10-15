{pkgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.firefox&release=master
  # http://www.mozilla.com/en-US/firefox/
  programs.firefox = {
    enable = true;

    nativeMessagingHosts = [pkgs.vdhcoapp];
  };
}
