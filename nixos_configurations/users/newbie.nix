{self, ...}: {
  imports = [
    (self.nixosModules.sops {
      keys = [
        (builtins.readFile ./id_ed25519.pub)
      ];

      user_name = "newbie";
    })

    (self.nixosModules.home_manager {
      imports = [
        (self.homeModules.common {user_name = "newbie";})

        (self.homeModules.sops {user_name = "newbie";})
      ];

      user_name = "newbie";
    })
  ];
}
