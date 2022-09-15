#!/bin/sh

# Initailize the network (genesis block)

docker_eth_init="docker run -v /root/.ethereum:/root/.ethereum ethereum/client-go:$INPUT_GETH_VERSION geth init /root/.ethereum/genesis.json"

sh -c "$docker_eth_init"

# Run the node

docker_run_node="docker run -d -p $INPUT_HOST_PORT:8545 -v /root/.ethereum:/root/.ethereum ethereum/client-go:$INPUT_GETH_VERSION geth"

# Network config
docker_run_node="$docker_run_node --networkid 2833"

# RPC config
docker_run_node="$docker_run_node --http --http.addr 0.0.0.0 --http.corsdomain \"*\" --http.vhosts \"*\" --http.api \"eth,web3,net,admin,db,miner\""

# Miner config
docker_run_node="$docker_run_node --mine --miner.etherbase 0981d20d34a0fc96e73ffa783d0c560156142d90 --miner.gasprice 0"

# Account unlock (for miner)
docker_run_node="$docker_run_node --allow-insecure-unlock --unlock 0981d20d34a0fc96e73ffa783d0c560156142d90 --password /root/.ethereum/password.txt"

sh -c "$docker_run_node"
