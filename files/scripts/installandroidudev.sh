#!/usr/bin/env bash

set -oue pipefail

curl -Lo /etc/yum.repos.d/_copr_ublue-os_staging.repo https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/fedora-"${OS_VERSION}"/ublue-os-staging-fedora-"${OS_VERSION}".repo
rpm-ostree install android-udev-rules
rm /etc/yum.repos.d/_copr_ublue-os_staging.repo

#LATEST_ANDROID_UDEV_RULES_COMMIT="e62577fade0e79a965edfff732b88f228266cb0b" # 20250525
#curl -OL "https://github.com/M0Rf30/android-udev-rules/archive/${LATEST_ANDROID_UDEV_RULES_COMMIT}.tar.gz"
#tar xvf "${LATEST_ANDROID_UDEV_RULES_COMMIT}.tar.gz" --strip-components=1


#install -m 644 51-android.rules /etc/udev/rules.d/
#mkdir -p /usr/lib/sysusers.d/
#install -m 644 android-udev.conf /usr/lib/sysusers.d/.