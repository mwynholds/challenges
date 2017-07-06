require '../helper'

class Problem52

  def good2(i)
    return false if i.to_s[0].to_i >= 5
    c = i.canonical_digits
    c == (i*2).canonical_digits
  end

  def good(i)
    return false if i.to_s[0].to_i >= 5
    c = i.canonical_digits
    c == (i*2).canonical_digits &&
      c == (i*3).canonical_digits &&
      c == (i*4).canonical_digits &&
      c == (i*5).canonical_digits &&
      c == (i*6).canonical_digits
  end

  def solve
    i = 1
    i += 1 until good i
    puts i
  end
end

Problem52.new.solve
