require '../helper'

class Problem55
  def lychrel?(n)
    (1..50).each do |i|
      n = n + n.reverse
      return false if n.palindrome?
    end
    true
  end

  def solve
    puts (1..9999).count { |n| lychrel?(n) }
  end

  def test
    assert false, lychrel?(47)
    assert false, lychrel?(349)
    assert true, lychrel?(196)
    assert true, lychrel?(4994)
  end
end

Problem55.new.test
puts
Problem55.new.solve
