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

  def self.single_chars
    (?!..?~)
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

  def self.english_score(bin)
    score = 0
    words = bin.split ' '
    common = %w(a an the this I he she they am is was were be and or)
    words.each do |word|
      score += 10 if common.include?(word) || common.include?(word.capitalize)
      score += 5  if word =~ /^[a-z0-9\,\.\;\:\'\"\!\&\(\)\-\_]+$/
      score -= 5  if word !~ /[aeiouy]/
      score -= 10 if word.length > 10
    end
    score
  end
end
