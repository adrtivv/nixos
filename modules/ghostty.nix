{...}: {
  flake.modules.homeManager.ghostty = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.ghostty&release=master
    # https://ghostty.org/
    programs.ghostty = {
      enable = true;

      settings = {
        cursor-click-to-move = true;

        bold-is-bright = true;

        mouse-hide-while-typing = true;

        # theme = "dark:Catppuccin Mocha,light:Catppuccin Latte";

        window-decoration = "none";
      };
    };
  };
}
