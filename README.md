# RPC Scavenger Hunt

## Scavenger hunt questions

### Solvable with a single `bitcoin-cli` command

[001.sh](/submission/001.sh): What is the hash of block 654,321?

[002.sh](/submission/002.sh): (true / false) Verify the signature by this address over this message:

- address: `1NChfewU45oy7Dgn51HwkBFSixaTnyakfj`
- message: `1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa`
- signature: `HCsBcgB+Wcm8kOGMH8IpNeg0H4gjCrlqwDf/GlSXphZGBYxm0QkKEPhh9DTJRp2IDNUhVr0FhP9qCqo2W0recNM=`

### Requires one or more `bitcoin-cli` commands and `jq` to extract object properties

[003.sh](/submission/003.sh): How many new outputs were created by block 123,456?

[004.sh](/submission/004.sh): Using descriptors, compute the taproot address at index 100 derived from this extended public key:
  - `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`

[005.sh](/submission/005.sh): Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
  - `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

### Requires multiple `bitcoin-cli` commands with `jq` and bash loops/conditionals

[006.sh](/submission/006.sh): Which tx in block 257,343 spends the coinbase output of block 256,128?

[007.sh](/submission/007.sh): Only one single output remains unspent from block 123,321. What address was it sent to?

[008.sh](/submission/008.sh): Which public key signed input 0 in this tx:
  - `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

[009.sh](/submission/009.sh): How many satoshis did this transaction pay for fee?:
  - `c346d9277128f5d67740f8847f11aff5cef440b6d102fcd5ddcdb40d9a12df42`

[010.sh](/submission/010.sh): Only one tx in block 444,431 signals opt-in RBF. What is its txid?:



## Example:

*How many transactions are confirmed in block 666,666?*

Using local full node (or with proxy settings in `bitcoin.conf`):

```sh
hash=$(bitcoin-cli getblockhash 666666)
block=$(bitcoin-cli getblock $hash)
echo $block | jq .nTx
```

Answer: `2728`
