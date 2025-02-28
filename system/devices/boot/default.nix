{ ... }:
{
  imports = [
    ./extlinux
    ./services
  ];

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
    "kernel.sysrq" = 1;
  };
}
