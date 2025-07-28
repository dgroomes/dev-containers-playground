#!/usr/bin/env sh

if [ -z "${VERSION:-}" ]; then
  echo "'VERSION' environment variable must be set."
  exit 1
fi

cargo install nu --locked --version "$VERSION"

echo "Installed Nushell version $(nu --version)"
