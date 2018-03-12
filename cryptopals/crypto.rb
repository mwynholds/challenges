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

  def self.xor(bin1, bin2)
    b1 = bin1.unpack "U*"
    b2 = bin2.unpack "U*"
    if b1.length > b2.length
      b2 = ( b2 * ( b1.length / b2.length ) )[0, b1.length]
    else
      b1 = ( b1 * ( b2.length / b1.length ) )[0, b2.length]
    end
    b1.zip(b2).map { |a,b| a^b }.pack "U*"
  end

  def self.english?(str)
    chars = str.split ''
    spaces = chars.count { |c| c == ' ' } / ( chars.length * 1.0 )
    letters = chars.count { |c| c =~ /[a-zA-Z]/ } / (chars.length * 1.0 )
    return spaces > 0.1 && spaces < 0.25 && letters > 0.7
  end
end
