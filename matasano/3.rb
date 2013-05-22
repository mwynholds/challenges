require './crypto'

hex = '1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736'

raw = hex.fromHex
best = Crypto.decodeSingleCharXOR raw

p best
