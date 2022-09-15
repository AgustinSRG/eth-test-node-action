# Ethereum test node (GitHub Action)

This [GitHub Action](https://github.com/features/actions) sets up a single-node and free-gas ethrereum RPC environment to automatically test smart contract projects.

This action is limited only to Github Actions. If you want to create a test ethreum node in your local computer, try this instead: [https://github.com/AgustinSRG/eth-test-node](https://github.com/AgustinSRG/eth-test-node)

## Usage

```yml
steps:
- uses: AgustinSRG/eth-test-node-action@v1.0
  with:
    rpcPort: 8545 # Optional, default value is 8545. The json-RPC port
    gethVersion: latest # Ethereum docker image version to use, latest by default
```

## Connecting to the node

In order to make use of the node, connect it using the HTTP interface (the node runs in the same host). Example with web3:

```js
const web3 = new Web3("http://localhost:8545");
```

## Accounts with balance

If you require accounts with balance, there are some of them defined in the genesis file, here is the full list:

| Account address                              | Balance       | Private Key                                                        |
| -------------------------------------------- | ------------- | ------------------------------------------------------------------ |
| `0x01a596Da8aEfA5d6caf233F1Bdaab2Da963B5830` | 100000000 ETH | `3de106f01f3fa595f215f50a0daf2ddd1bd061663b69396783a70dcee9f1f755` |
| `0x64eBC0159b5FDCEe8EE623DCc7bF8D296F17826B` | 100000000 ETH | `b6cc360b19ce026fd49052de6fb683b5e10f9a1713320848c1ed9ab2e25ed11d` |
| `0xA953F261F8277C6c54951e1E2f04360dEA066fa1` | 100000000 ETH | `8acfcb9c3df4cdadf8837c515e925e5110cf9097474489ad253c358e69abe672` |
| `0xa87B7E7E2274A611E3d63AB2d690b6a772036E48` | 100000000 ETH | `1a774dd0f467418e0ebfceb3187b9073642b9a2610be2116b636e244168b5514` |

Since the min gas price is set to 0, you can make smart contract transactions at 0 cost if you specify the gas price to 0 in the transaction parameters.
