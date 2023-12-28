// Example test

"use strict";

import Web3 from 'web3';
import { FeeMarketEIP1559TxData, FeeMarketEIP1559Transaction } from '@ethereumjs/tx';
import { Common } from '@ethereumjs/common';

import { expect } from 'chai';

describe("Ethereum RPC Test", function () {

    this.timeout(20000);

    /* Schema test */

    const web3 = new Web3("http://localhost:8545")

    let block;

    it('Should provide the lastest block properly', async () => {
        block = await web3.eth.getBlock("latest");
        expect(block).not.to.be.null;
    });

    it('Should provide a base fee per gas of 0 (free)', async () => {
        const gasPriceBigint = BigInt(block.baseFeePerGas);
        expect(gasPriceBigint).to.be.equal(BigInt(0));
    });

    const customCommon = Common.custom(
        {
            name: 'my-network',
            networkId: 2833,
            chainId: 2833,
        },
        {
            baseChain: "mainnet",
            hardfork: 'london',
        }
    );

    const privateKey = "3de106f01f3fa595f215f50a0daf2ddd1bd061663b69396783a70dcee9f1f755";
    const privateKeyBuffer = Buffer.from(privateKey, "hex");
    const account = web3.eth.accounts.privateKeyToAccount(privateKey);

    let txHash: string;

    it('Should allow sending a transaction', async () => {
        const nonce = await web3.eth.getTransactionCount(account.address, "pending");
        const nonceHex = web3.utils.toHex(nonce);
        const gasLimitHex = web3.utils.toHex(6000000);

        const txData: FeeMarketEIP1559TxData = {
            nonce: nonceHex,
            gasLimit: gasLimitHex,
            chainId: await web3.eth.getChainId(),
            maxFeePerGas: "0x0",
            maxPriorityFeePerGas: "0x0",
            to: "0xA953F261F8277C6c54951e1E2f04360dEA066fa1",
            value: "0x01"
        };

        let tx = new FeeMarketEIP1559Transaction(txData, { common: customCommon });

        // Sign transaction

        tx = tx.sign(privateKeyBuffer);
        const serializedTx = tx.serialize();

        // Send tx

        txHash = await (new Promise<string>((resolve, reject) => {
            web3.eth.sendSignedTransaction('0x' + Buffer.from(serializedTx).toString('hex')).then(receipt => {
                resolve(web3.utils.toHex(receipt.transactionHash));
            }).catch(err => {
                reject(err);
            });
        }));
    });

    it('Should include the transaction into a block', async () => {
        let receipt = null;
        while (receipt === null) {
            receipt = await web3.eth.getTransactionReceipt(txHash);

            if (!receipt) {
                await (new Promise(function (resolve2) {
                    setTimeout(resolve2, 1000);
                }));
            }
        }
    });
});
