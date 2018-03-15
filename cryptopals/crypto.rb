class Crypto
  def self.hex2bin(hex)
    [hex].pack "H*"
  end

  def self.bin2hex(bin)
    bin.unpack("H*")[0]
  end

  def self.bin2base64(bin)
    Base64.strict_encode64 bin
  end

  def self.base642bin(base64)
    Base64.decode64 base64
  end

  def self.single_chars
    (?!..?~).to_a + [' ']
  end

  def self.xor(bin, key)
    b1 = bin.each_byte.to_a
    b2 = key.each_byte.to_a
    if b1.length > b2.length
      b2 = ( b2 * ( b1.length / b2.length + 1 ) )[0, b1.length]
    else
      b1 = ( b1 * ( b2.length / b1.length + 1 ) )[0, b2.length]
    end
    b1.zip(b2).map { |a,b| a^b }.pack "U*"
  end

  def self.english_letters
    { 'a' => 8.167, 'b' => 1.492, 'c' => 2.782, 'd' => 4.253, 'e' => 12.702, 'f' => 2.228, 'g' => 2.015, 'h' => 6.094, 'i' => 6.966,
      'j' => 0.153, 'k' => 0.772, 'l' => 4.025, 'm' => 2.406, 'n' => 6.749,  'o' => 7.507, 'p' => 1.929, 'q' => 0.095, 'r' => 5.987,
      's' => 6.327, 't' => 9.056, 'u' => 2.758, 'v' => 0.978, 'w' => 2.360,  'x' => 0.150, 'y' => 1.974, 'z' => 0.074, ' ' => 25.000 }
  end

  def self.english_score(bin)
    score = 0
    letters = bin.split ''
    english = english_letters
    letters.each do |letter|
      score += english.fetch(letter.downcase, 0)
      score -= 10 unless letter =~ /[a-z0-9\,\.\;\:\'\"\!\&\(\)\-\_ ]/i
    end
    score
  end

  def self.hamming(str1, str2)
    raise "Strings must be same length: '#{str1}' <=> '#{str2}'" unless str1.length == str2.length
    str1.bytes.zip(str2.bytes).reduce(0) do |h, (a, b)|
      h + (a^b).to_s(2).count("1")
    end
  end
end
