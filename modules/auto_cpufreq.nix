{inputs, ...}: {
  # flake.modules.nixos.auto_cpufreq = { ...}: {
  #   # https://wiki.nixos.org/wiki/Laptop#auto-cpufreq
  #   # https://github.com/AdnanHodzic/auto-cpufreq
  #   programs.auto-cpufreq = {
  #     enable = true;

  #     settings = {
  #       battery = {
  #         # enable_thresholds = true;

  #         # energy_perf_bias = "balance_power";

  #         # energy_performance_preference = "power";

  #         governor = "powersave";

  #         # platform_profile = "low-power";

  #         # scaling_max_freq = "1000000";

  #         # scaling_min_freq = "800000";

  #         # start_threshold = "20";

  #         # stop_threshold = "80";

  #         turbo = "auto";
  #       };

  #       charger = {
  #         # energy_perf_bias = "balance_performance";

  #         # energy_performance_preference = "performance";

  #         governor = "performance";

  #         # platform_profile = "performance";

  #         # scaling_max_freq = "1000000";

  #         # scaling_min_freq = "800000";

  #         turbo = "auto";
  #       };
  #     };
  #   };

  #   imports = [inputs.auto_cpufreq.nixosModules.default];
  # };
}
