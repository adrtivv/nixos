{...}: {
  # https://home-manager-options.extranix.com/?query=programs.tealdeer&release=master
  programs.tealdeer = {
    enable = true;
    settings.updates.auto_update = true;
  };
}
