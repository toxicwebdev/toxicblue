#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

rpm --import https://download.docker.com/linux/fedora/gpg
echo -e "[docker-ce-stable]\nname=Docker CE Stable - $basearch\nbaseurl=https://download.docker.com/linux/fedora/$releasever/$basearch/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://download.docker.com/linux/fedora/gpg\n\n[docker-ce-testing]\nname=Docker CE Testing - $basearch\nbaseurl=https://download.docker.com/linux/fedora/$releasever/$basearch/test\nenabled=0\ngpgcheck=1\ngpgkey=https://download.docker.com/linux/fedora/gpg" | sudo tee /etc/yum.repos.d/docker-ce.repo > /dev/null