#!/bin/sh
set -e

export RUST_BACKTRACE=1

# Use environment variables for configuration
BARKD_DATADIR="${BARKD_DATADIR:-/data/barkd}"
BARKD_PORT="${BARKD_PORT:-3000}"
BARKD_HOST="${BARKD_HOST:-0.0.0.0}"

# Create datadir if it doesn't exist
mkdir -p "${BARKD_DATADIR}"

echo "Starting barkd"
echo "  datadir: ${BARKD_DATADIR}"
echo "  port: ${BARKD_PORT}"
echo "  host: ${BARKD_HOST}"

/usr/local/bin/barkd \
    --datadir "${BARKD_DATADIR}" \
    --port "${BARKD_PORT}" \
    --host "${BARKD_HOST}"
