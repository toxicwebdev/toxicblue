# Toxicblue

<p align="center">
  <img src="assets/toxic.png" href="[https://github.com/toxicwebdev/toxicblue](https://github.com/toxicwebdev/toxicblue)" width=300/>
</p>

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/2503a44c1105456483517f793af75ee7)](https://app.codacy.com/gh/toxicwebdev/toxicblue/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![toxicblue](https://github.com/toxicwebdev/toxicblue/actions/workflows/build.yml/badge.svg)](https://github.com/toxicwebdev/toxicblue/actions/workflows/build.yml)
[![toxicblue-dx](https://github.com/toxicwebdev/toxicblue/actions/workflows/build-dx.yml/badge.svg)](https://github.com/toxicwebdev/toxicblue/actions/workflows/build-dx.yml)
[![trivy](https://github.com/toxicwebdev/toxicblue/actions/workflows/trivy.yml/badge.svg)](https://github.com/toxicwebdev/toxicblue/actions/workflows/trivy.yml)

## Overview

toxicblue is a project that leverages the [BlueBuild](https://blue-build.org/) template to create minimally-opinionated [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) operating system images for various Wayland compositors. The project aims to provide ready-to-use images with sane defaults for the following compositors:

- Hyprland (with waybar)
- niri (with waybar)
- Qtile (experimental)
- River (with waybar)
- Sway (with waybar)
- Wayfire (with wf-shell)

## DX Images

A developer workstation that provides a container-focused experience.

## Features

- Saner SDDM defaults
- Optimized waybar defaults
- Comprehensive toolkit for a functional Wayland compositor desktop
- Pre-configured, minimally opinionated setups for each supported compositor

## Purpose

While the Fedora Atomic ecosystem offers excellent base images and tools for immutable image building, it lacks readily available images for most Wayland compositors (except Sway). toxicblue fills this gap by providing images with sensible defaults for a variety of Wayland compositors.

## Customization

For custom modifications, it's recommended to create a new repo using the [BlueBuild template](https://github.com/blue-build/template) rather than forking this project. Set your `base-image` to a toxicblue image to apply your customizations efficiently without constant upstream synchronization.

## Installation

### Available Images

> [!NOTE]
> *`nvidia-open` images are recommended for systems with Nvidia GPUs Turing or newer.*
>
> *`nvidia` images are recommended for systems with Nvidia GPUs Pascal or older.*

| Name                      | Compositor | Nvidia Support      |
|---------------------------|------------|---------------------|
| `hyprland`                | Hyprland   | No                  |
| `hyprland-dx`             | Hyprland   | No                  |
| `hyprland-nvidia`         | Hyprland   | Yes, closed drivers |
| `hyprland-nvidia-dx`      | Hyprland   | Yes, closed drivers |
| `hyprland-nvidia-open`    | Hyprland   | Yes, open drivers   |
| `hyprland-nvidia-open-dx` | Hyprland   | Yes, open drivers   |
| `niri`                    | Niri       | No                  |
| `niri-dx`                 | Niri       | No                  |
| `niri-nvidia`             | Niri       | Yes, closed drivers |
| `niri-nvidia-dx`          | Niri       | Yes, closed drivers |
| `niri-nvidia-open`        | Niri       | Yes, open drivers   |
| `niri-nvidia-open-dx`     | Niri       | Yes, open drivers   |
| `qtile`                   | Qtile      | No                  |
| `qtile-dx`                | Qtile      | No                  |
| `qtile-nvidia`            | Qtile      | Yes, closed drivers |
| `qtile-nvidia-dx`         | Qtile      | Yes, closed drivers |
| `qtile-nvidia-open`       | Qtile      | Yes, open drivers   |
| `qtile-nvidia-open-dx`    | Qtile      | Yes, open drivers   |
| `river`                   | River      | No                  |
| `river-dx`                | River      | No                  |
| `river-nvidia`            | River      | Yes, closed drivers |
| `river-nvidia-dx`         | River      | Yes, closed drivers |
| `river-nvidia-open`       | River      | Yes, open drivers   |
| `river-nvidia-open-dx`    | River      | Yes, open drivers   |
| `sway`                    | Sway       | No                  |
| `sway-dx`                 | Sway       | No                  |
| `sway-nvidia`             | Sway       | Yes, closed drivers |
| `sway-nvidia-dx`          | Sway       | Yes, closed drivers |
| `sway-nvidia-open`        | Sway       | Yes, open drivers   |
| `sway-nvidia-open-dx`     | Sway       | Yes, open drivers   |
| `wayfire`                 | Wayfire    | No                  |
| `wayfire-dx`              | Wayfire    | No                  |
| `wayfire-nvidia`          | Wayfire    | Yes, closed drivers |
| `wayfire-nvidia-dx`       | Wayfire    | Yes, closed drivers |
| `wayfire-nvidia-open`     | Wayfire    | Yes, open drivers   |
| `wayfire-nvidia-open-dx`  | Wayfire    | Yes, open drivers   |

### Rebasing Process

To rebase an existing Silverblue/Kinoite/Sericea installation to the latest toxicblue build:

> [!IMPORTANT]
> Only the `latest` tag is supported.
> [!NOTE]
> Two reboots are required. The first boot into toxicblue provisions the necessary SDDM user, a one-time step.

1. Rebase to the unsigned image:

    ```bash
    rpm-ostree rebase ostree-unverified-registry:ghcr.io/toxicwebdev/$IMAGE_NAME:latest
    ```

2. Reboot:

    ```bash
    systemctl reboot
    ```

3. Rebase to the signed image:

    ```bash
    rpm-ostree rebase ostree-image-signed:docker://ghcr.io/toxicwebdev/$IMAGE_NAME:latest
    ```

4. Final reboot:

    ```bash
    systemctl reboot
    ```

### Post-install

#### Nvidia

If you are using an nvidia image, run this after installation:

```bash
rpm-ostree kargs \
    --append-if-missing=rd.driver.blacklist=nouveau \
    --append-if-missing=modprobe.blacklist=nouveau \
    --append-if-missing=nvidia-drm.modeset=1 \
    --append-if-missing=nvidia-drm.fbdev=1
```

You may also need this (solves flickering and LUKS issues on some nvidia hardware):

```bash
rpm-ostree kargs \
    --append-if-missing=initcall_blacklist=simpledrm_platform_driver_init
```

#### Nvidia optimus laptop

If you are using an nvidia image on an optimus laptop, run this after installation:

```bash
ujust configure-nvidia-optimus
```

## Screenshots

![sway](assets/sway.png)

![hyprland](assets/hyprland.png)

## Verification

Images are signed using [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). Verify signatures by downloading the `cosign.pub` file and running:

```bash
cosign verify --key cosign.pub ghcr.io/toxicwebdev/$IMAGE_NAME:latest
```

## Contributing

Please refer to the [contributing documentation](CONTRIBUTING.md#contributing) and adhere to the [Code of Conduct](CODE_OF_CONDUCT.md).
