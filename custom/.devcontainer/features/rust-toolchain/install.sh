#!/usr/bin/env sh

if [ -z "${VERSION:-}" ]; then
  echo "'VERSION' environment variable must be set."
  exit 1
fi

curl --silent --show-error --fail https://sh.rustup.rs | sh -s -- -y --default-toolchain "$VERSION" --verbose

echo "Installed 'rustup' version $(rustup --version)"
echo "Installed 'rustc' version $(rustc --version)"
echo "Installed 'cargo' version $(cargo --version)"
