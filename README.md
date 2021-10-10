# android_device_realme_RMX2173-pbrp
For building PBRP for realme Q2 Pro

## Features

Works:

- ADB
- Decryption of /data
- Screen brightness settings
- Vibration on touch

## Compile

First checkout minimal pbrp with omnirom tree:

```
repo init --depth=1 -u git://github.com/PitchBlackRecoveryProject/manifest_pb.git -b android-11.0 --groups=all,-notdefault,-device,-darwin,-x86,-mips

repo sync

|or|

repo sync --force-sync --no-clone-bundle --no-tags -j$(nproc --all)
```

Finally execute these:

```
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch omni_RMX2173-eng
mka -j$(nproc --all) pbrp

|or|

export ALLOW_MISSING_DEPENDENCIES=true; source build/envsetup.sh; lunch omni_RMX2173-eng; mka -j$(nproc --all) pbrp
```
