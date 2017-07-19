class String

  def cap?
    length > 0 && self[0] =~ /[A-Z]/
  end

  def upcase?
    self == self.upcase
  end

  def to_piglatin
    split(/ /).map do |word|
      next "" if word.length == 0
      _, pre_punc, first, rest, post_punc = *(/^(\W*)([^aeiouqAEIOUQ]*(?:[qQ][uU]?)?)(\w*)(\W*)$/.match word)
      pig = "#{rest}#{first}ay"
      pig = pig.capitalize if first.cap?
      pig = pig.upcase if word.upcase?
      "#{pre_punc}#{pig}#{post_punc}"
    end.join ' '
  end

end

class Piglatin
  def assert(expected, actual)
    if expected == actual
      print '.'
    else
      puts
      puts "Expected '#{expected}' but got '#{actual}'"
    end
  end

  def test
    assert "ellohay", "hello".to_piglatin
    assert "applesay", "apples".to_piglatin
    assert "eatay orldway", "eat world".to_piglatin
    assert "Ellohay", "Hello".to_piglatin
    assert "Eatay", "Eat".to_piglatin
    assert "ellohay...  orldway?!", "hello...  world?!".to_piglatin
    assert "oolschay", "school".to_piglatin
    assert "ickquay", "quick".to_piglatin
    assert "eezesquay", "squeeze".to_piglatin
    assert "ELLOHAY", "HELLO".to_piglatin
    assert "ountqay", "qount".to_piglatin
    assert "iay", "i".to_piglatin
    assert "('ELLOHAY', 'Orldway')", "('HELLO', 'World')".to_piglatin
    puts
  end
end

Piglatin.new.test
