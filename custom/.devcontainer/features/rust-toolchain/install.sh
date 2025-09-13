#!/usr/bin/env sh

set -eu

if [ -z "${VERSION:-}" ]; then
  echo "'VERSION' environment variable must be set."
  exit 1
fi

# Download and run the rustup installation script
curl --silent --show-error --fail https://sh.rustup.rs --output rustup-init.sh
sh rustup-init.sh -y --default-toolchain "$VERSION" --verbose

rustup --version
rustc --version
cargo --version
