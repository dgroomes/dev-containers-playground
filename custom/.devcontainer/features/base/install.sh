#!/usr/bin/env sh

set -eu

apt-get update
apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  pkg-config \
  git \
  jq