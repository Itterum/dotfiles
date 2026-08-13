#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [[ -n "${ZED_CONFIG_DIR:-}" ]]; then
  config_dir="$ZED_CONFIG_DIR"
elif [[ -d "$HOME/.var/app/dev.zed.Zed/config/zed" ]]; then
  config_dir="$HOME/.var/app/dev.zed.Zed/config/zed"
else
  config_dir="$HOME/.config/zed"
fi

mkdir -p "$config_dir/themes"
install -m 0644 "$script_dir/settings.json" "$config_dir/settings.json"
install -m 0644 "$script_dir/keymap.json" "$config_dir/keymap.json"
install -m 0644 "$script_dir/debug.json" "$config_dir/debug.json"
install -m 0644 "$script_dir/themes/catppuccin-system.json" \
  "$config_dir/themes/catppuccin-system.json"

printf 'Zed configuration installed in %s\n' "$config_dir"
