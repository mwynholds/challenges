require '../helper'

class Problem5
  def test

  end

  def solve
    input = <<EOF
Burning 'em, if you ain't quick and nimble
I go crazy when I hear a cymbal
EOF
    input.strip!
    expected = <<EOF
0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272
a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f
EOF
    expected.strip!.gsub! "\n", ""

    message = Message.new binary: input
    actual = Crypto.bin2hex message.encrypt_xor "ICE"
    assert expected, actual
  end
end

Helper.run Problem5
