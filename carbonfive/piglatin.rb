class String

  def cap?
    length > 0 && self[0] =~ /[A-Z]/
  end

  def all_cap?
    split(//).all? { |c| c !~ /[a-z]/ }
  end

  def capitalize_all
    split(//).map { |c| c.capitalize }.join ''
  end

  def to_piglatin
    split(/ /).map do |word|
      next "" if word.length == 0
      _, first, rest, punc = *(/^([^aeiouqAEIOUQ]*(?:[qQ][uU]?)?)([A-Za-z]*)(.*)$/.match word)
      pig = "#{rest}#{first}ay#{punc}"
      pig = pig.capitalize if first.cap?
      pig = pig.capitalize_all if word.all_cap?
      pig
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
    puts
  end
end

Piglatin.new.test
