class String

  def cap?
    length > 0 && self[0] =~ /[A-Z]/
  end

  def to_piglatin
    split(/ /).map do |word|
      next "" if word.length == 0
      _, first, rest, punc = *(/^(qu|[^aeiouAEIOU]*)([A-Za-z]*)(.*)$/.match word)
      pig = "#{rest}#{first}ay#{punc}"
      pig.capitalize! if first.cap?
      pig
    end.join ' '
  end

  private


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
    puts
  end
end

Piglatin.new.test
