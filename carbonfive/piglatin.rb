class String

  def cap?
    length > 0 && self[0] =~ /[A-Z]/
  end

  def to_pig_latin
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
    assert "ellohay", "hello".to_pig_latin
    assert "applesay", "apples".to_pig_latin
    assert "eatay orldway", "eat world".to_pig_latin
    assert "Ellohay", "Hello".to_pig_latin
    assert "Eatay", "Eat".to_pig_latin
    assert "ellohay...  orldway?!", "hello...  world?!".to_pig_latin
    assert "oolschay", "school".to_pig_latin
    assert "ickquay", "quick".to_pig_latin
    puts
  end
end

Piglatin.new.test
