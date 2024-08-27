#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/etc/camera/pureShot_parameter.xml)
            [ "$2" = "" ] && return 0
            sed -i 's/=\([0-9]\+\)>/="\1">/g' "${2}"
            ;;
        vendor/lib64/hw/camera.xiaomi.so)
            [ "$2" = "" ] && return 0
	    "${SIGSCAN}" -p "AA 06 00 94" -P "1F 20 03 D5" -f "${2}"
            ;;
	vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so)
            [ "$2" = "" ] && return 0
	    "${SIGSCAN}" -p "8D 0A 00 94" -P "1F 20 03 D5" -f "${2}"
	    ;;
        vendor/lib64/vendor.xiaomi.hardware.cameraperf@1.0-impl.so)
            [ "$2" = "" ] && return 0
	    "${SIGSCAN}" -p "7C 00 00 94" -P "1F 20 03 D5" -f "${2}"
            ;;
        *)
            return 1
            ;;
    esac

    return 0
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=venus
export DEVICE_COMMON=sm8350-common
export VENDOR=xiaomi
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
