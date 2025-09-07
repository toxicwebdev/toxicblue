#!/usr/bin/env bash

set -oue pipefail

sed -i 's/sway\/workspaces/niri\/workspaces/' /etc/xdg/waybar/config.jsonc
sed -i 's/sway\/window/niri\/window/' /etc/xdg/waybar/config.jsonc