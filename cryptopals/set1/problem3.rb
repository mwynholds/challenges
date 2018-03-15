require '../helper'

class Problem3
  def test

  end

  def solve
    hex = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
    message = Message.new hex: hex
    results = message.break_xor Crypto.single_chars
    p results
  end
end

Helper.run Problem3
