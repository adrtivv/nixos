{...}: {
  flake.modules.homeManager.eza = {...}: {
    # https://home-manager-options.extranix.com/?query=programs.eza&release=master
    # https://github.com/eza-community/eza
    programs.eza = {
      colors = "auto";

      enable = true;

      git = true;

      icons = "auto";
    };
  };
}
