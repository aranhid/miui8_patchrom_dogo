#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11849728 4a26bb70330b1b02c339d3cbbd946b95c354656a 13273088 f30d579f6e1e44d967452b3577af117554d40620
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/FOTAKernel:11849728:4a26bb70330b1b02c339d3cbbd946b95c354656a; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:13273088:f30d579f6e1e44d967452b3577af117554d40620 EMMC:/dev/block/platform/msm_sdcc.1/by-name/FOTAKernel 4a26bb70330b1b02c339d3cbbd946b95c354656a 11849728 f30d579f6e1e44d967452b3577af117554d40620:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
