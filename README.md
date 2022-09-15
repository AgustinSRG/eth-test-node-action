# Ethereum test node (GitHub Action)

This [GitHub Action](https://github.com/features/actions) sets up a single-node and free-gas ethrereum RPC environment to automatically test smart contract projects.

This action is limited only to Github Actions. If you want to create a test ethreum node in your local computer, try this instead: [https://github.com/AgustinSRG/eth-test-node](https://github.com/AgustinSRG/eth-test-node)

## Usage

```yml
steps:
- uses: AgustinSRG/eth-test-node-action@v1.0
  with:
    host port: 8545 # Optional, default value is 8545. The json-RPC port
```

## Connecting to the node

In order to make use of the node, connect it using the HTTP interface (the node runs in the same host). Example with web3:

```js
const web3 = new Web3("http://localhost:8545");
```

## Accounts with balance

If you require accounts with balance, there are some of them defined in the genesis file, here is the full list:

| Account address | Balance | Private Key |
| --------------- | ------- | ----------- |
| `0x`            | 10 ETH  | `0x`        |

Since the min gas prince is set to 0, you can make smart contract transactions at 0 cost if you specify the gas price to 0 in the transaction parameters.
