#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PKG_DIR="$SCRIPT_DIR/usb-to-archive_deb"

if [ ! -d "$PKG_DIR/debian" ]; then
  echo "Error: package directory not found at $PKG_DIR" >&2
  exit 1
fi

cd "$PKG_DIR"
# -d skips Debian build-deps checks, useful when building on Arch.
exec dpkg-buildpackage -us -uc -a arm64
