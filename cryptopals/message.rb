require "#{__dir__}/crypto"

class Message
  def initialize(hex: nil, binary: nil, base64: nil)
    @hex = hex
    @binary = binary
    @base64 = base64
  end

  def hex
    @hex ||= Crypto.bin2hex(binary)
  end

  def binary
    @binary ||= ( ( @hex && Crypto.hex2bin(@hex) ) || ( @base64 && Crypto.base642bin(@base64) ) )
  end

  def base64
    @base64 ||= Crypto.bin2base64 binary
  end

  def break_xor(possibles)
    possibles.map do |possible|
      decrypted = decrypt_xor possible
      { key: possible, message: decrypted, score: Crypto.english_score(decrypted) }
    end.max_by { |val| val[:score] }
  end

  def decrypt_xor(key)
    Crypto.xor binary, key
  end

  def encrypt_xor(key)
    decrypt_xor key
  end

  def guess_keysize(n = 1)
    (2..40).map do |ks|
      slices = binary.scan(/.{#{ks}}/)[0, 4]
      distances = (0..2).map { |i| Crypto.hamming(slices[i], slices[i+1]) / ( (ks-1) * 1.0 ) }
      avg = distances.reduce(&:+) / ( slices.length * 1.0 )
      { keysize: ks, avg: avg }
    end.min_by(n) { |o| o[:avg] }
  end

  def pad(n)
    padding = n - binary.length
    binary + ( padding.chr * padding )
  end
end
