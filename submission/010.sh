# Only one tx in block 444,431 signals opt-in RBF. What is its txid?

#block hash 000000000000000000018930f9272f3ed41ec57543b05fdb3b96beac24a8127b

bitcoin-cli getblock 000000000000000000018930f9272f3ed41ec57543b05fdb3b96beac24a8127b 2 | jq -r '.tx[] | select(.vin[].sequence < 4294967294) | .txid'