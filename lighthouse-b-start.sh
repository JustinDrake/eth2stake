#!/bin/bash

echo "Starting lighthouse beacon"

. eth2-settings.sh

docker volume create lighthouse_b_vol

# --suggested-fee-recipient $FEE_RECIPIENT \
docker run -d --restart always --name lighthouse-b --network host \
  --mount 'type=volume,src=lighthouse_b_vol,dst=/root/.lighthouse' \
  $DOCKER_LIGHTHOUSE lighthouse b --network mainnet --http --metrics \
  --http-address :: \
  --validator-monitor-auto \
  $BEACON_OPTS \
  --eth1 --eth1-endpoints $ETH1_ENDPOINTS
