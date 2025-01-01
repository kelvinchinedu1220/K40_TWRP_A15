#!/sbin/sh

set_device_codename() {
	resetprop "ro.build.product" "$1"
	resetprop "ro.omni.device" "$1"
	resetprop "ro.product.device" "$1"
	for i in odm product system system_ext vendor; do
		resetprop "ro.product.${i}.device" "$1"
	done
}

set_device_model() {
	resetprop "ro.product.model" "$1"
	for i in odm product system system_ext vendor; do
		resetprop "ro.product.${i}.model" "$1"
	done
}

case "$(getprop ro.boot.hwc)" in
	"INDIA")
		set_device_codename "aliothin"
		set_device_model "Mi 11X"
		;;
	"GLOBAL")
		set_device_codename "alioth"
		set_device_model "POCO F3"
		;;
	"")
		set_device_codename "alioth"
		set_device_model "Redmi K40"
		;;
esac

exit 0