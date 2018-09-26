#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

docker run \
  --rm \
  --name squid \
  --network host \
  --volume "$HOME/Development/0__data/squid":var/spool/squid:rw
  local/squid "$@"
  # OR
  # maxmilton/squid "$@"
