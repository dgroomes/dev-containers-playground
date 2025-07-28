#!/usr/bin/env sh

apt-get update
apt-get install -y --no-install-recommends \
  build-essential \
  curl \
  pkg-config \
  git \
  jq
