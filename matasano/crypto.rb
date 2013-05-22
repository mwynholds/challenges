require 'openssl'

def assert_equal(expected, result)
  if expected == result
    puts "SUCCESS!"
  else
    puts "FAILURE:"
    puts "  exepected: #{expected}"
    puts "  result:    #{result}"
  end
end

class String
  def toHex
    self.unpack("H*")[0]
  end

  def fromHex
    [self].pack("H*")
  end

  def toBase64
    [self].pack("m0")
  end

  def fromBase64
    self.unpack("m0")[0]
  end

  def xor(key)
    encrypted = []
    self.each_char.with_index do |char, i|
      encrypted << (char.ord ^ key[i % key.length].ord).chr
    end
    encrypted.join
  end

  def hamming(str)
    raise "Hamming distance only works on strings of equal length" unless self.length == str.length
    a = self.unpack("B*")[0]
    b = str.unpack("B*")[0]
    total = 0
    a.each_char.with_index do |char, i|
      total += 1 unless char == b[i]
    end
    total
  end

  FREQ = {
    'a' => 8.167, 'b' => 1.492, 'c' => 2.782, 'd' => 4.253, 'e' => 12.702,
    'f' => 2.228, 'g' => 2.015, 'h' => 6.094, 'i' => 6.966, 'j' => 0.153,
    'k' => 0.772, 'l' => 4.025, 'm' => 2.406, 'n' => 6.749, 'o' => 7.507,
    'p' => 1.929, 'q' => 0.095, 'r' => 5.987, 's' => 6.327, 't' => 9.056,
    'u' => 2.758, 'v' => 0.978, 'w' => 2.360, 'x' => 0.150, 'y' => 1.974,
    'z' => 0.074
  }

  def score
    std = self.count " !'(),.0-9?A-Za-z"
    non_std = self.length - std
    penalty = ( non_std * 100.0 ) / self.length

    str = self.downcase.gsub(/[^a-z]/, '')
    unit = 100.0 / str.length

    freq = FREQ.dup
    str.each_char { |c| freq[c] -= unit if freq[c] }

    penalty + freq.values.map {|f| f.abs}.reduce(:+)
  end
end

class Crypto
  def self.decodeSingleCharXOR(str)
    best = { score: 200 }
    (1..255).each do |i|
      xor = str.xor i.chr
      score = xor.score
      if score < best[:score]
        best = { score: score, key: i.chr, value: xor }
      end
    end
    best
  end

  def self.decodeMultiCharXOR(str, max_ks = 40)
    keysizes = []
    hamming_samples = 4
    (2..max_ks).each do |ks|
      substr = str[0, ks*hamming_samples*2]
      slices = substr.scan(/.{#{ks}}/m).each_slice(2)
      hammings = slices.map {|a,b| a.hamming(b) / (ks*1.0)}
      hamming = hammings.reduce(:+) / (hammings.length*1.0)
      keysizes << { keysize: ks, hamming: hamming }
    end

    keysizes.sort! {|a,b| a[:hamming] <=> b[:hamming]}

    best = { score: 200 }
    (0..3).each do |i|
      ks = keysizes[i][:keysize]
      blocks = str.scan(/.{1,#{ks}}/m)
      blocks.pop if blocks.last.length != blocks.first.length
      transposed = transpose blocks
      keys = transposed.map { |enc| decodeSingleCharXOR(enc)[:key] }
      key = keys.join
      decrypted = str.xor key
      score = decrypted.score
      best = { score: score, key: key, value: decrypted } if score < best[:score]
    end
    best
  end

  def self.transpose(blocks)
    raise "Transpose requires all blocks to be the same length" unless blocks.map {|b| b.length}.uniq.length == 1
    n = blocks[0].length
    transposed = []
    (0..n-1).each do |i|
      transposed << blocks.map {|b| b[i]}.join
    end
    transposed
  end
end
