require '../helper'

class Problem3
  def test

  end

  def solve
    hex = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
    str = Crypto.hex2bin hex
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    chars.each do |char|
      message = Crypto.xor str, char
      if Crypto.english? message
        puts "Key: #{char}"
        puts "Message: #{message}"
      end
    end
  end
end

Helper.run Problem3
