#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

rm -f /etc/yum.repos.d/fedora-updates-archive.repo
rm -f /etc/yum.repos.d/fedora-updates-testing.repo
rm -f /etc/yum.repos.d/negativo17-fedora-nvidia.repo
rm -f /etc/yum.repos.d/negativo17-fedora-multimedia.repo
rm -f /etc/yum.repos.d/eyecantcu-supergfxctl.repo
rm -f /etc/yum.repos.d/_copr_ublue-os-akmods.repo
rm -f /etc/yum.repos.d/nvidia-container-toolkit.repo
rm -f /etc/yum.repos.d/google-chrome.repo
rm -f /etc/yum.repos.d/rpmfusion-free-updates-testing.repo
rm -f /etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo
rm -f /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo
rm -f /etc/yum.repos.d/rpmfusion-nonfree-steam.repo