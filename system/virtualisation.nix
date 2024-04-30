{ pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.qemu.verbatimConfig = ''
    user = "thunlix"
    group = "kvm"
    cgroup_device_acl = [
      "/dev/input/by-id/usb-ASUSTeK_Computer_Inc._N-KEY_Device-if02-event-kbd",
      "/dev/input/by-id/usb-Logitech_USB_Receiver-if01-event-mouse",
      "/dev/null", "/dev/full", "/dev/zero",
      "/dev/random", "/dev/urandom", "/dev/ptmx",
      "/dev/kvm", "/dev/rtc", "/dev/hpet"
    ]
  '';
}
