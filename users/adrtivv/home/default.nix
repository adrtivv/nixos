{
  pkgs,
  specialArgs,
  ...
}: {
  # https://home-manager-options.extranix.com/?query=fonts&release=master
  fonts.fontconfig = {
    defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font Mono"];
      sansSerif = ["JetBrainsMono Nerd Font"];
      serif = ["JetBrainsMono Nerd Font"];
    };
    enable = true;
  };

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
      gparted
      lenovo-legion
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
      obsidian
      # https://wiki.nixos.org/wiki/OpenRGB
      # https://search.nixos.org/options?channel=unstable&query=services.hardware.openrgb
      openrgb-with-all-plugins
      qbittorrent
      specialArgs.inputs.zen_browser.packages.${specialArgs.system}.default
      sops
      tokei
      unrar
      vlc
      ytarchive
    ];

    # This value determines the home Manager release that your configuration is compatible with. This helps avoid breakage when a new home Manager release introduces backwards incompatible changes. You can update home Manager without changing this value. See the home Manager release notes for a list of state version changes in each release.
    stateVersion = "24.11";

    username = "${specialArgs.userName}";
  };

  imports = [
    specialArgs.inputs.sops_nix.homeManagerModules.sops
    ./bash
    ./bat
    ./bottom
    ./broot
    ./direnv
    ./eza
    ./fastfetch
    ./fd
    ./firefox
    ./foliate
    ./gh
    ./ghostty
    ./git
    ./gitui
    ./helix
    ./home-manager
    ./jujutsu
    ./mpv
    ./nh
    ./plasma
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
