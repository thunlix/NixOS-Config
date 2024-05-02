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
		 asusctl
		 supergfxctl
               ];
             };
           in
           [ env ];

    preStart =
    ''
      mkdir -p /var/lib/libvirt/hooks
      ln -sf /home/thunlix/.dotfiles/system/hooks/qemu /var/lib/libvirt/hooks/qemu
      ln -sf /home/thunlix/.dotfiles/system/hooks/qemu.d/win10/ /var/lib/libvirt/hooks/qemu.d/
      #ln -sf /home/thunlix/.dotfiles/system/hooks/qemu.d/win10/vm-vars.conf /var/lib/libvirt/hooks/qemu.d/win10/
    
      chmod +x /var/lib/libvirt/hooks/qemu.d/win10
    '';
  };
}
