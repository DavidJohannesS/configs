#!/bin/bash
if [ "$SUDO_USER" ]; then
    HOME_DIR=$(getent passwd "$SUDO_USER" | cut -d: -f6)
else
    HOME_DIR=$HOME
fi

# Define an associative array with key-value pairs
declare -A CONFIG_DIRS=(
    [nvim]="$HOME_DIR/.config/nvim"
    [i3]="$HOME_DIR/.config/i3"
    [nitrogen]="$HOME_DIR/.config/nitrogen"
    [picom]="$HOME_DIR/.config/picom"
    [sxhkd]="$HOME_DIR/.config/sxhkd"
    [rofi]="$HOME_DIR/.config/rofi"
    [bspwm]="$HOME_DIR/.config/bspwm"
)

# Get the script's directory
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Iterate over the associative array
for config in "${!CONFIG_DIRS[@]}"; do
    if [ -d "${CONFIG_DIRS[$config]}" ]; then
        echo "${config} config exists"
    else
        cp -r "$SCRIPT_DIR/dotconfig/$config" "${CONFIG_DIRS[$config]}"
	echo "Copied ${config} over"
    fi
done
