# How many new outputs were created by block 123,456?

blockhash=$(bitcoin-cli getblockhash 123456)
bitcoin-cli getblock $blockhash 2 | jq '[.tx[].vout] | add | length'



