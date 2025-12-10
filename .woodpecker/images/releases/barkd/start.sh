#!/bin/sh
set -e

export RUST_BACKTRACE=1

# Use environment variables for configuration
BARKD_DATADIR="${BARKD_DATADIR:-/data/barkd}"
BARKD_PORT="${BARKD_PORT:-3000}"
BARKD_HOST="${BARKD_HOST:-0.0.0.0}"
BARK_NETWORK="${BARK_NETWORK:-signet}"
BARK_ARK="${BARK_ARK:-ark.signet.2nd.dev}"
BARK_ESPLORA="${BARK_ESPLORA:-esplora.signet.2nd.dev}"

# Create datadir if it doesn't exist
mkdir -p "${BARKD_DATADIR}"

# Initialize wallet if it doesn't exist
if [ ! -d "${BARKD_DATADIR}" ]; then
  echo "Initializing bark wallet"
  echo "  network: ${BARK_NETWORK}"
  echo "  ark: ${BARK_ARK}"
  echo "  esplora: ${BARK_ESPLORA}"

  if [ "${BARK_NETWORK}" = "mainnet" ]; then
    /usr/local/bin/bark create --datadir "${BARKD_DATADIR}" --ark "${BARK_ARK}" --esplora "${BARK_ESPLORA}"
  else
    /usr/local/bin/bark create --datadir "${BARKD_DATADIR}" --${BARK_NETWORK} --ark "${BARK_ARK}" --esplora "${BARK_ESPLORA}"
  fi
fi

echo "Starting barkd"
echo "  datadir: ${BARKD_DATADIR}"
echo "  port: ${BARKD_PORT}"
echo "  host: ${BARKD_HOST}"

/usr/local/bin/barkd \
    --datadir "${BARKD_DATADIR}" \
    --port "${BARKD_PORT}" \
    --host "${BARKD_HOST}"
