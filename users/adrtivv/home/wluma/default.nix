{...}: {
  # https://home-manager-options.extranix.com/?query=services.wluma&release=master
  # https://github.com/maximbaz/wluma
  services.wluma = {
    enable = true;

    systemd.enable = true;
  };
}
