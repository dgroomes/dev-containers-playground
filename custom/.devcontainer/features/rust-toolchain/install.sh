#!/usr/bin/env sh

curl --silent --show-error --fail https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.88.0 --verbose

echo "Installed 'rustup' version $(rustup --version)"
echo "Installed 'rustc' version $(rustc --version)"
echo "Installed 'cargo' version $(cargo --version)"
