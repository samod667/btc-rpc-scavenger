# Which tx in block 257,343 spends the coinbase output of block 256,128?
#block=$(bitcoin-cli getblock 0000000000000007440fc4df4d953acbf67ad26adb2d7dff7bee90318b41e6c6)
#block257343hash  = 0000000000000004f3fb306baa0638ffc181bc6b9752f9325612559c04d57bf9



coinbasetx=$(bitcoin-cli getblock 0000000000000007440fc4df4d953acbf67ad26adb2d7dff7bee90318b41e6c6 | jq -r '.tx[0]')

bitcoin-cli getblock 0000000000000004f3fb306baa0638ffc181bc6b9752f9325612559c04d57bf9 2 | jq -r --arg coinbasetx "$coinbasetx" '.tx[] | select(.vin[] | .txid == $coinbasetx) | .txid'




