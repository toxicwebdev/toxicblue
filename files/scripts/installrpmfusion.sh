#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

#rpm-ostree install \
#    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${OS_VERSION}.noarch.rpm \
#    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${OS_VERSION}.noarch.rpm

rpm-ostree install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${OS_VERSION}.noarch.rpm \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-nonfree-release-${OS_VERSION}.noarch.rpm