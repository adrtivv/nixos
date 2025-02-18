{
  pkgs,
  specialArgs,
  ...
}: {
  # https://home-manager-options.extranix.com/?query=home&release=master
  home = {
    # # link the configuration file in current directory to the specified location in home directory
    # file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

    # # link all files in `./scripts` to `~/.config/i3/scripts`
    # file.".config/i3/scripts" = {
    #   executable = true;  # make all files executable
    #   recursive = true;   # link recursively
    #   source = ./scripts;
    # };

    # # encode the file content in nix configuration file directly
    # file.".xxx".text = ''
    #     xxx
    # '';

    homeDirectory = "/home/${specialArgs.userName}";

    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      brave
      ffmpeg
      file
      foliate
      gparted
      obsidian
      qbittorrent
      sops
      tokei
      vlc
      ytarchive
      specialArgs.inputs.zen_browser.packages.${specialArgs.system}.default
    ];

    # This value determines the home Manager release that your configuration is compatible with. This helps avoid breakage when a new home Manager release introduces backwards incompatible changes. You can update home Manager without changing this value. See the home Manager release notes for a list of state version changes in each release.
    stateVersion = "24.11";

    username = "${specialArgs.userName}";
  };

  imports = [
    specialArgs.inputs.sops-nix.homeManagerModules.sops
    ./bash
    ./bat
    ./bottom
    ./broot
    ./direnv
    ./eza
    ./fastfetch
    ./fd
    ./firefox
    ./gh
    ./ghostty
    ./git
    ./gitui
    ./helix
    ./home-manager
    ./mpv
    ./ripgrep
    ./starship
    ./tealdeer
    ./zed-editor
    ./zoxide
  ];

  # https://home-manager-options.extranix.com/?query=services.easyeffects&release=master
  services.easyeffects = {
    enable = true;
    # preset = "";
  };

  sops = {
    # Path to where the age private key is to be derived and stored at or an existing age private key is to be found.
    age.keyFile = "/home/${specialArgs.userName}/.config/sops/age/keys.txt";
    # Path to where the sops age encrypted secrets can be accessed.
    defaultSopsFile = ../../../secrets.yaml;
    secrets = {
      "users/${specialArgs.userName}/id_ed25519" = {
        path = "/home/${specialArgs.userName}/.ssh/id_ed25519";
      };
    };
    validateSopsFiles = false;
  };

  # # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };
}
