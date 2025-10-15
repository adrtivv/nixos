{...}: {
  # https://home-manager-options.extranix.com/?query=programs.tealdeer&release=master
  # https://github.com/dbrgn/tealdeer
  programs.tealdeer = {
    enable = true;

    settings.updates.auto_update = true;
  };
}
