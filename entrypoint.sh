#!/bin/sh

# Store config files in vars

GENESIS_CONTENT=$(cat /networkFiles/config/genesis.json | base64 | tr -d '\n\r')
NODE_PUB_KEY='0x40fcf42050e5195c590f32329efc8510436ac9e6ea751f949ce64bc7420be1fc6edb881b614eb292b624200fb9af8b880746254122af4fee436ce04060a21cbc'
NODE_PRIV_KEY='0x60ad021fcd4540cdf0f321085293d0e96d81c3e54bd5dbbdbe1cb07f5615a003'

# Setup Dockerfile

echo "FROM hyperledger/besu:latest" > Dockerfile
echo "USER root:root" >> Dockerfile
echo "RUN mkdir -p /etc/besu/keys" >> Dockerfile
echo "RUN mkdir -p /etc/besu/config" >> Dockerfile
echo "RUN echo '${GENESIS_CONTENT}' | base64 -d > /etc/besu/config/genesis.json" >> Dockerfile
echo "RUN echo '${NODE_PUB_KEY}' > /etc/besu/keys/key.pub" >> Dockerfile
echo "RUN echo '${NODE_PRIV_KEY}' > /etc/besu/keys/key" >> Dockerfile

echo "Dockerfile:"
cat Dockerfile

# Build image

sh -c "docker build -t eth-test-node:latest ."

# Run the node

docker_run_node="docker run --rm -d -p $INPUT_RPCPORT:8545 -p $INPUT_WEBSOCKETPORT:8546 eth-test-node:latest"

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
