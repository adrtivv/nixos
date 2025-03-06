{...}: {
  # https://nix-community.github.io/plasma-manager/options.xhtml
  programs.plasma = {
    configFile.kdeglobals.General = {
      TerminalApplication = "ghostty";
      TerminalService = "com.mitchellh.ghostty.desktop";
    };
    enable = true;
  };
}
