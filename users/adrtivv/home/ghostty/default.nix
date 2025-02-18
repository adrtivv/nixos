{...}: {
  # https://home-manager-options.extranix.com/?query=programs.ghostty&release=master
  programs.ghostty = {
    enable = true;
    settings = {
      cursor-click-to-move = true;
      bold-is-bright = true;
      mouse-hide-while-typing = true;
      theme = "dark:catppuccin-mocha,light:catppuccin-latte";
      window-decoration = "none";
    };
  };
}
