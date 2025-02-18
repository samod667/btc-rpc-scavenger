# Only one single output remains unspent from block 123,321. What address was it sent to?

# Get block hash
block_hash=$(bitcoin-cli getblockhash 123321)

# Get all transactions in this block
txids=$(bitcoin-cli getblock $block_hash | jq -r '.tx[]')

# Check each transaction
for txid in $txids; do

    # Check for unspent outputs
    vouts=$(bitcoin-cli getrawtransaction $txid true | jq -r '.vout | keys[]')

    for vout in $vouts; do
        utxo=$(bitcoin-cli gettxout $txid $vout)
        # Only if not spent        
        if [ ! -z "$utxo" ]; then
            echo "$(echo "$utxo" | jq -r '.scriptPubKey.address')"
        fi
    done
done