<h5 align="center">Notice: These images are considered beta.</h5>

<p align="center">
  <a href="https://github.com/toxicwebdev/toxicblue">
    <img src="https://github.com/toxicwebdev/toxicblue/assets/129108030/38139f2c-e91e-40dd-88b1-951c1021c51c" href="https://github.com/toxicwebdev/toxicblue" width=180 />
  </a>
</p>

<h1 align="center">toxicblue</h1>


[![toxicblue](https://github.com/toxicwebdev/toxicblue/actions/workflows/build.yml/badge.svg)](https://github.com/toxicwebdev/toxicblue/actions/workflows/build.yml)
[![trivy](https://github.com/toxicwebdev/toxicblue/actions/workflows/trivy.yml/badge.svg)](https://github.com/toxicwebdev/toxicblue/actions/workflows/trivy.yml)

This repo takes the [BlueBuild](https://blue-build.org/) template and builds out minimally-opinionated [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) operating system images for the following wayland compositors:

- hyprland (with waybar)
- sway (with waybar)
- river (with waybar)
- qtile (experimental)

## What

Changes and decisions in the images:
- Set saner SDDM defaults
- Set saner waybar defaults
- Add a reasonable suite of tools that are needed to have a working desktop with a wayland compositor 
- Build in a minimally opinionated config for each compositor and tools that work out of the box

## Why

The Fedora Atomic ecosystem provides excellent base images and tooling for immutable image building. Aside from sway however, there aren't images available for wayland compositors. This repo aims to provide those images and provide them with sane defaults.

For more info on BlueBuild, check out the [BlueBuild homepage](https://blue-build.org/).


## Customization

If you want to add your own customizations on top of wayblue, you are advised strongly against forking. Instead, create a repo for your own image by using the [BlueBuild template](https://github.com/blue-build/template), then change your `base-image` to a wayblue image. This will allow you to apply your customizations to wayblue in a concise and maintainable way, without the need to constantly sync with upstream. 


## Installation

#### SDDM images (recommended)

| Name                     | WM       | Nvidia Support           |
|--------------------------|----------|--------------------------|
| `hyprland`               | Hyprland | No                       |
| `qtile`                  | Qtile    | No                       |
| `river`                  | River    | No                       |
| `sway`                   | Sway     | No                       |

### Rebasing

To rebase an existing Silverblue/Kinoite/Sericea installation to the latest build: 
> [!IMPORTANT] 
> The **only** supported tag is `latest`.

> [!NOTE] 
> The two reboots described below are not optional. During installation, the initial boot into wayblue will provision the required sddm user. This is a one time step, all subsequent boots will succeed.

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/toxicwebdev/$IMAGE_NAME:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/toxicwebdev/$IMAGE_NAME:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

## Screenshots
![sway](https://github.com/toxicwebdev/toxicblue/assets/129108030/9dc4d4a2-843a-4598-9717-2be88e23498b)

![hyprland](https://github.com/toxicwebdev/toxicblue/assets/129108030/dc1422fd-efd5-4ec1-8a2d-e1a3887fe8b8)

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/toxicwebdev/$IMAGE_NAME:latest
```

## Contributing

Follow the [contributing documentation](CONTRIBUTING.md#contributing), and make sure to respect the [CoC](CODE_OF_CONDUCT.md).
