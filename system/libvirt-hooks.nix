{ pkgs, config, ... }:
{
  systemd.services.libvirtd = {
    path = let
             env = pkgs.buildEnv {
               name = "qemu-hook-env";
               paths = with pkgs; [
                 bash
                 libvirt
                 kmod
                 systemd
                 ripgrep
                 sd
               ];
             };
           in
           [ env ];

    preStart =
    ''
      mkdir -p /var/lib/libvirt/hooks
      #mkdir -p /var/lib/libvirt/hooks/qemu.d/win10/prepare/begin
      #mkdir -p /var/lib/libvirt/hooks/qemu.d/win10/release/end

      ln -sf /home/thunlix/.dotfiles/system/hooks /var/lib/libvirt/hooks
      #ln -sf /home/owner/Desktop/Sync/Files/Linux_Config/symlinks/kvm.conf /var/lib/libvirt/hooks/kvm.conf
      #ln -sf /home/owner/Desktop/Sync/Files/Linux_Config/symlinks/start.sh /var/lib/libvirt/hooks/qemu.d/win10/prepare/begin/start.sh
      #ln -sf /home/owner/Desktop/Sync/Files/Linux_Config/symlinks/stop.sh /var/lib/libvirt/hooks/qemu.d/win10/release/end/stop.sh
      #ln -sf /home/owner/Desktop/Sync/Files/Linux_Config/symlinks/patched.rom /var/lib/libvirt/vgabios/patched.rom

      #chmod +x /var/lib/libvirt/hooks/qemu
      #chmod +x /var/lib/libvirt/hooks/kvm.conf
      #chmod +x /var/lib/libvirt/hooks/qemu.d/win10/prepare/begin/start.sh
      #chmod +x /var/lib/libvirt/hooks/qemu.d/win10/release/end/stop.sh
    '';
  };
}
