#!/usr/bin/env bash

set -oue pipefail

RPMFUSION_FREE="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${OS_VERSION}.noarch.rpm"

curl --retry 3 --retry-delay 5 -LO "${RPMFUSION_FREE}"

rpm-ostree install \
    "rpmfusion-free-release-${OS_VERSION}.noarch.rpm"