{...}: {
  # https://nix-community.github.io/plasma-manager/options.xhtml
  programs.plasma = {
    configFile.kdeglobals.General = {
      TerminalApplication = "ghostty";
      TerminalService = "com.mitchellh.ghostty.desktop";
    };
    desktop = {
      icons = {
        alignment = "left";
        arrangement = "topToBottom";
        sorting = {
          foldersFirst = false;
          mode = "name";
        };
      };
    };
    enable = true;
    panels = [
      {
        alignment = "center";
        floating = false;
        hiding = "autohide";
        lengthMode = "fill";
        opacity = "adaptive";
      }
    ];
  };
}
