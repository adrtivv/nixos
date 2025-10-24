{self, ...}: {
  imports = [
    (self.nixosModules.sops {
      keys = [
        (builtins.readFile ./id_ed25519.pub)
      ];

      user_name = "adrtivv";
    })

    (self.nixosModules.home_manager {
      imports = [
        (self.homeModules.common {user_name = "adrtivv";})

        (self.homeModules.git {
          email_address = "adrtivv@gmail.com";

          user_name = "adrtivv";
        })

        (self.homeModules.jujutsu {
          email_address = "adrtivv@gmail.com";

          user_name = "adrtivv";
        })

        self.homeModules.gh

        self.homeModules.gitui

        (self.homeModules.sops {user_name = "adrtivv";})
      ];

      user_name = "adrtivv";
    })
  ];
}
