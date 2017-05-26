#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9789440 1df8eaf2090fdd8a04bb818ce1882c5443d24a01 7374848 dce467b4e0f7e9c34cf4eb2356574ea3e4ee122c
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9789440:1df8eaf2090fdd8a04bb818ce1882c5443d24a01; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7374848:dce467b4e0f7e9c34cf4eb2356574ea3e4ee122c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 1df8eaf2090fdd8a04bb818ce1882c5443d24a01 9789440 dce467b4e0f7e9c34cf4eb2356574ea3e4ee122c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
