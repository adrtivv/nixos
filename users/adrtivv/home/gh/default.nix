{pkgs, ...}: {
  # https://home-manager-options.extranix.com/?query=programs.gh&release=master
  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-copilot
      gh-poi
      gh-markdown-preview
    ];
    settings = {
      git_protocol = "ssh";
    };
  };
}
