{
  lib,
  pkgs,
  ...
}: {
  # https://home-manager-options.extranix.com/?query=services.swayidle&release=master
  # https://github.com/swaywm/swayidle
  services.swayidle = let
    # before_sleep = pkgs.writeShellScript "before_sleep" ''
    #   ${loginctl} lock_session
    # '';
    # lock_after_blank_timeout = 5 * minutes;
    # lock_session = pkgs.writeShellScript "lock_session" ''
    #   ${swaylock} -f
    #   ${niri_bin} msg action power_off_monitors
    # '';
    # loginctl = "${pkgs.systemd}/bin/loginctl";
    # minutes = 60 * seconds;
    # niri_bin = lib.getExe pkgs.niri;
    # screen_blank_timeout = 15 * minutes;
    # seconds = 1;
    # swaylock = "usr/bin/swaylock";
  in {
    enable = true;

    # events = [
    #   {
    #     command = lock_session.outPath;

    #     event = "lock";
    #   }

    #   {
    #     command = before_sleep.outPath;

    #     event = "before_sleep";
    #   }
    # ];

    # timeouts = [
    #   {
    #     command = "${niri_bin} msg action power_off_monitors";

    #     timeout = screen_blank_timeout;
    #   }
    #   {
    #     command = "${loginctl} lock_session";

    #     timeout = lock_after_blank_timeout + screen_blank_timeout;
    #   }
    # ];
  };

  # systemd.user.services.swayidle.Unit.After = lib.mkForce "niri.service";
}
