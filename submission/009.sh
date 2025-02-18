# How many satoshis did this transaction pay for fee?:
#  `c346d9277128f5d67740f8847f11aff5cef440b6d102fcd5ddcdb40d9a12df42`


bitcoin-cli getrawtransaction c346d9277128f5d67740f8847f11aff5cef440b6d102fcd5ddcdb40d9a12df42 2 | jq '(.fee * 100000000) | floor'
