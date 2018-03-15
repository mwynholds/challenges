require "#{__dir__}/crypto"

class Message
  def initialize(hex: nil, binary: nil)
    @hex = hex
    @binary = binary
  end

  def hex
    @hex ||= Crypto.bin2hex(@binary)
  end

  def binary
    @binary ||= Crypto.hex2bin(@hex)
  end

  def to_base64
    Crypto.bin2base64 binary
  end

  def break_xor(possibles)
    possibles.map do |possible|
      decrypted = decrypt_xor possible
      { key: possible, message: decrypted, score: Crypto.english_score(decrypted) }
    end.max { |val| val[:score] }
  end

  def decrypt_xor(key)
    Crypto.xor binary, key
  end

  def encrypt_xor(key)
    decrypt_xor key
  end
end
