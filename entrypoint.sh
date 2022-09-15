#!/bin/sh

# Generate dockerfile

echo "FROM ethereum/client-go:$INPUT_GETHVERSIONt" > Dockerfile.geth
echo "COPY /ethconfig/keystore /root/.ethereum/keystore" > Dockerfile.geth
echo "COPY /ethconfig/genesis.json ." >> Dockerfile.geth
echo "COPY /ethconfig/password.txt ." >> Dockerfile.geth
echo "RUN geth init genesis.json" >> Dockerfile.geth
echo "EXPOSE 8545" >> Dockerfile.geth

# Build image

docker build --tag eth-test-node - < Dockerfile.geth

# Run the node

docker_run_node="docker run --rm -d -p $INPUT_RPCPORT:8545 eth-test-node geth"

# Network config
docker_run_node="$docker_run_node --networkid 2833"

# RPC config
docker_run_node="$docker_run_node --http --http.addr 0.0.0.0 --http.corsdomain \"*\" --http.vhosts \"*\" --http.api \"eth,web3,net,admin,db,miner\""

# Miner config
docker_run_node="$docker_run_node --mine --miner.etherbase 0981d20d34a0fc96e73ffa783d0c560156142d90 --miner.gasprice 0"

# Account unlock (for miner)
docker_run_node="$docker_run_node --allow-insecure-unlock --unlock 0981d20d34a0fc96e73ffa783d0c560156142d90 --password /root/.ethereum/password.txt"

sh -c "$docker_run_node"
