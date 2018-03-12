require '../helper'

class Problem2
  def test

  end

  def solve
    hex1 = "1c0111001f010100061a024b53535009181c"
    hex2 = "686974207468652062756c6c277320657965"
    expectedHex = "746865206b696420646f6e277420706c6179"

    str1 = Crypto.hex2bin hex1
    str2 = Crypto.hex2bin hex2
    xor = Crypto.xor str1, str2
    actualHex = Crypto.bin2hex xor

    assert expectedHex, actualHex
  end
end

Helper.run Problem2
