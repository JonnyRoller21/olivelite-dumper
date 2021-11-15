#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:7b54be4f5d43c9fcc70e7d18175a5ff74f085161 > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:33554432:a113d7b4153b58d2c3b9f79f78cac51698957fed \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:7b54be4f5d43c9fcc70e7d18175a5ff74f085161 >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi
