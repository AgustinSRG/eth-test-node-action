#!/bin/sh

# Generate genesis file

echo "FROM ethereum/client-go:$INPUT_GETHVERSION" > Dockerfile
echo "RUN mkdir -p /root/.ethereum/keystore" >> Dockerfile
echo "RUN echo 'eyJhZGRyZXNzIjoiMDk4MWQyMGQzNGEwZmM5NmU3M2ZmYTc4M2QwYzU2MDE1NjE0MmQ5MCIsImNyeXB0byI6eyJjaXBoZXIiOiJhZXMtMTI4LWN0ciIsImNpcGhlcnRleHQiOiJhMGFlZTFhMWIyOGEwNjNhM2IyMGVlZWQ5MDE5NWQxMmFiNDI1ZjUxNWJhZGFkMDZlODEwNjE5MGZhY2I5ZGJiIiwiY2lwaGVycGFyYW1zIjp7Iml2IjoiOWI5NjIyNjY5ZTQ3MWY1YjNjZTNjNzYyYmE2NWQxYzEifSwia2RmIjoic2NyeXB0Iiwia2RmcGFyYW1zIjp7ImRrbGVuIjozMiwibiI6MjYyMTQ0LCJwIjoxLCJyIjo4LCJzYWx0IjoiYTM0Y2RmNmRkODE3MGFjOThlZjk1ZDBjOTMxNDQyMjc3NTFiMGU1OGE0MzY0NTc5MTdlZTZjMGUzODczMmY0MiJ9LCJtYWMiOiI1MjdkZWRiMmIyNjU2Y2VmNDBhZmJjY2RkYWQyNmQ2OTExYjIzNTQ4ODg1YzlmMTQ4MDk4ZWFiYTk5MWQwN2FjIn0sImlkIjoiNTdkYjc5ZmQtNDU5Yy00MzMwLWI4YWUtZTExMDcxM2Q1NTg2IiwidmVyc2lvbiI6M30K' | base64 -d > /root/.ethereum/keystore/UTC--2018-11-21T14-56-26.159803693Z--0981d20d34a0fc96e73ffa783d0c560156142d90" >> Dockerfile
echo "RUN echo 'ew0KICAiY29uZmlnIjogew0KICAgICJjaGFpbklkIjogMjgzMywNCiAgICAiaG9tZXN0ZWFkQmxvY2siOiAwLA0KICAgICJlaXAxNTBCbG9jayI6IDAsDQogICAgImVpcDE1NUJsb2NrIjogMCwNCiAgICAiZWlwMTU4QmxvY2siOiAwLA0KICAgICJieXphbnRpdW1CbG9jayI6IDAsDQogICAgImNvbnN0YW50aW5vcGxlQmxvY2siOiAwLA0KICAgICJwZXRlcnNidXJnQmxvY2siOiAwLA0KICAgICJpc3RhbmJ1bEJsb2NrIjogMCwNCiAgICAiYmVybGluQmxvY2siOiAwLA0KICAgICJsb25kb25CbG9jayIgOiAwLA0KICAgICJjbGlxdWUiOiB7DQogICAgICAicGVyaW9kIjogMSwNCiAgICAgICJlcG9jaCI6IDMwMDAwDQogICAgfSwNCiAgICAiY29udHJhY3RTaXplTGltaXQiOiAyMTQ3NDgzNjQ3DQogIH0sDQogICJleHRyYURhdGEiOiAiMHgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDk4MWQyMGQzNGEwZmM5NmU3M2ZmYTc4M2QwYzU2MDE1NjE0MmQ5MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAiLA0KICAiZGlmZmljdWx0eSI6ICIxIiwNCiAgImJhc2VGZWVQZXJHYXMiOiAiMHgwIiwNCiAgImdhc0xpbWl0IiA6ICIweDFmZmZmZmZmZmZmZmZmIiwNCiAgImFsbG9jIjogew0KICAgICIwOTgxZDIwZDM0YTBmYzk2ZTczZmZhNzgzZDBjNTYwMTU2MTQyZDkwIjogew0KICAgICAgImJhbGFuY2UiOiAiMTAwMDAwMDAwMDAwMDAwMDAwMDAiDQogICAgfSwNCiAgICAiNjNhY2MyNTY0YmQ0NTZkNmRmZWRlYWJmMjE4NmFjYmFjNGIwNGQxNSI6IHsNCiAgICAgICJiYWxhbmNlIjogIjEwMDAwMDAwMDAwMDAwMDAwMDAwIg0KICAgIH0sDQogICAgIjB4MDFhNTk2RGE4YUVmQTVkNmNhZjIzM0YxQmRhYWIyRGE5NjNCNTgzMCI6IHsNCiAgICAgICJiYWxhbmNlIjogIjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCINCiAgICB9LA0KICAgICIweDY0ZUJDMDE1OWI1RkRDRWU4RUU2MjNEQ2M3YkY4RDI5NkYxNzgyNkIiOiB7DQogICAgICAiYmFsYW5jZSI6ICIxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAiDQogICAgfSwNCiAgICAiMHhBOTUzRjI2MUY4Mjc3QzZjNTQ5NTFlMUUyZjA0MzYwZEVBMDY2ZmExIjogew0KICAgICAgImJhbGFuY2UiOiAiMTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIg0KICAgIH0sDQogICAgIjB4YTg3QjdFN0UyMjc0QTYxMUUzZDYzQUIyZDY5MGI2YTc3MjAzNkU0OCI6IHsNCiAgICAgICJiYWxhbmNlIjogIjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCINCiAgICB9DQogIH0NCn0=' | base64 -d > /genesis.json" >> Dockerfile
echo "RUN echo 'password' > /password.txt" >> Dockerfile
echo "RUN geth init /genesis.json" >> Dockerfile
echo "EXPOSE 8545" >> Dockerfile
echo "EXPOSE 8546" >> Dockerfile

# Build image

sh -c "docker build -t eth-test-node:latest ."

# Run the node

docker_run_node="docker run --rm -d -p $INPUT_RPCPORT:8545 -p $INPUT_WEBSOCKETPORT:8546 eth-test-node:latest geth"

# Network config
docker_run_node="$docker_run_node --networkid 2833"

# RPC config
docker_run_node="$docker_run_node --http --http.port 8545 --http.addr 0.0.0.0 --http.corsdomain \"*\" --http.vhosts \"*\" --http.api \"eth,web3,net,admin,db,miner\""

# RPC config
if [ "$INPUT_WEBSOCKET" = "ON" ]
then
    docker_run_node="$docker_run_node --ws --ws.port 8546 --ws.addr 0.0.0.0 --ws.origins \"*\" --ws.api \"eth,web3,net,admin,db,miner\""
fi

# Miner config
docker_run_node="$docker_run_node --mine --miner.etherbase 0981d20d34a0fc96e73ffa783d0c560156142d90 --miner.gasprice 0"

# Account unlock (for miner)
docker_run_node="$docker_run_node --allow-insecure-unlock --unlock 0981d20d34a0fc96e73ffa783d0c560156142d90 --password /password.txt"

echo "Running Docker command: ${docker_run_node}"

sh -c "$docker_run_node"
