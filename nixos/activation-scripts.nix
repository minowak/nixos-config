{ config, pkgs, ... }:

{
  system.activationScripts.signKernel = {
    text = ''
      for f in /boot/EFI/systemd/*.efi; do
        echo "Signing $f..."
        ${pkgs.sbsigntool}/bin/sbsign \
          --key /etc/secureboot/db.key \
          --cert /etc/secureboot/db.crt \
          --output "$f" "$f"
      done
      for f in /boot/EFI/nixos/*bzImage.efi; do
        echo "Signing $f..."
        ${pkgs.sbsigntool}/bin/sbsign \
          --key /etc/secureboot/db.key \
          --cert /etc/secureboot/db.crt \
          --output "$f" "$f"
      done
      '';
  };
}
