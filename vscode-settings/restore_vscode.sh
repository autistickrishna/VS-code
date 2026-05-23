#!/usr/bin/env bash
set -euo pipefail

# Restore VS Code settings and extensions from this folder.
# Usage: Run this script after installing VS Code.

USER_SETTINGS_DIR="$HOME/Library/Application Support/Code/User"

echo "Restoring VS Code settings to: $USER_SETTINGS_DIR"

mkdir -p "${USER_SETTINGS_DIR}"

echo "Copying settings.json..."
cp -f "$(dirname "$0")/settings.json" "${USER_SETTINGS_DIR}/settings.json"

echo "Copying snippets (if any)..."
if [ -d "$(dirname "$0")/snippets" ]; then
  mkdir -p "${USER_SETTINGS_DIR}/snippets"
  cp -Rf "$(dirname "$0")/snippets/"* "${USER_SETTINGS_DIR}/snippets/" || true
fi

echo "Installing extensions from extensions.txt (requires 'code' CLI)."
if command -v code >/dev/null 2>&1; then
  xargs -L 1 code --install-extension < "$(dirname "$0")/extensions.txt" || true
else
  echo "VS Code 'code' CLI not found. To install it: open VS Code -> Command Palette -> 'Shell Command: Install 'code' command in PATH' and rerun this script."
fi

echo "Restore complete. Restart VS Code to apply settings."
