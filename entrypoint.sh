#!/bin/sh

# Run the node

docker_run_node="docker run --rm -d -p $INPUT_RPCPORT:8545 -p $INPUT_WEBSOCKETPORT:8546 -v /networkFiles/config:/etc/besu/config -v /networkFiles/keys/bootnode:/etc/besu/keys hyperledger/besu"

# Node config

docker_run_node="$docker_run_node --data-path=/opt/besu/database"
docker_run_node="$docker_run_node --genesis-file=/etc/besu/config/genesis.json"
docker_run_node="$docker_run_node --node-private-key-file=/etc/besu/keys/key"
docker_run_node="$docker_run_node --rpc-http-max-active-connections=999999"
docker_run_node="$docker_run_node --min-gas-price=0"
docker_run_node="$docker_run_node --rpc-http-enabled"
docker_run_node="$docker_run_node --rpc-http-host=0.0.0.0"
docker_run_node="$docker_run_node --rpc-http-api=ETH,NET,WEB3"
docker_run_node="$docker_run_node --rpc-ws-enabled"
docker_run_node="$docker_run_node --rpc-ws-host=0.0.0.0"
docker_run_node="$docker_run_node --rpc-ws-port=8546"
docker_run_node="$docker_run_node --rpc-ws-api=ETH,NET,WEB3"
docker_run_node="$docker_run_node --host-allowlist='*'"
docker_run_node="$docker_run_node --rpc-http-cors-origins='all'"
docker_run_node="$docker_run_node --logging=INFO"

echo "Running Docker command: ${docker_run_node}"

sh -c "$docker_run_node"
