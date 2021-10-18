#!/system/bin/sh
product=$(sed -n '/ro.build.product/ p' /cache/runtime.prop | cut -d'=' -f2)
device=$(sed -n '/ro.commonsoft.ota/ p' /cache/runtime.prop | cut -d'=' -f2)
soft=$(sed -n '/ro.separate.soft/ p' /cache/runtime.prop | cut -d'=' -f2)
name=$(sed -n '/ro.oppo.market.name/ p' /cache/runtime.prop | cut -d'=' -f2 | sed 's/realme //')
echo "product is ${product}"
echo "device is ${device}"
echo "soft is ${soft}"
echo "name is ${name}"

if [ "$product" ]; then
  echo "change product"
  sed -i "s/RMX2173/${product}/" /prop.default
  sed -i "s/RMX2173/${product}/" /default.prop
  resetprop ro.product.name "omni_${product}"
  resetprop ro.product.odm.name "omni_${product}"
  resetprop ro.product.vendor.name "omni_${product}"
fi

if [ "$device" ]; then
  echo "change device"
  resetprop ro.product.device "${device}"
  resetprop ro.product.odm.device "${device}"
  resetprop ro.product.vendor.device "${device}"
else
  echo "pass change device"
  resetprop ro.product.device RMX2175CN
  resetprop ro.product.odm.device RMX2175CN
  resetprop ro.product.vendor.device RMX2175CN
fi

if [ "$soft" ]; then
  echo "change soft"
  resetprop ro.separate.soft "${soft}"
else
  echo "pass change soft"
  resetprop ro.separate.soft 20633
fi

if [ "$name" ]; then
  echo "change name"
  sed -i "s/Q2 Pro 5G/${name}/" /prop.default
  sed -i "s/Q2 Pro 5G/${name}/" /default.prop
  resetprop ro.product.model "${name}"
  resetprop ro.product.odm.model "${name}"
  resetprop ro.product.vendor.model "${name}"
fi

resetprop --file /prop.default
resetprop --file /default.prop
