require '../helper'

class Problem1
  def test

  end

  def solve
    hex = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
    expected = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

    bin = Crypto.hex2bin hex
    actual = Crypto.bin2base64 bin
    assert expected, actual
  end
end

Helper.run Problem1
