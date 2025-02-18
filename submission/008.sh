# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`


script=$(bitcoin-cli getrawtransaction e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163 true | jq -r '.vin[0].txinwitness[2]')

# Use sed to match and extract the 66-character public key
pub_key=$(echo "$script" | grep -oP '(?<=21)[0-9a-f]{66}' | head -n 1)

echo "$pub_key"
