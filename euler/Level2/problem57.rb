require '../helper'

class Problem57
  def sq(n)
    (1 + sq2(n)).rationalize
  end

  def sq2(n)
    return Rational(1, 2) if n == 1
    Rational(1, 2 + sq2(n-1))
  end

  def solve
    count = (1..1000).count do |n|
      r = sq n
      r.numerator.num_digits > r.denominator.num_digits
    end
    puts count
  end

  def test
    assert 3, sq(1).numerator
    assert 2, sq(1).denominator
    assert 7, sq(2).numerator
    assert 5, sq(2).denominator
    assert 17, sq(3).numerator
    assert 12, sq(3).denominator
  end
end

Problem57.new.test
puts
Problem57.new.solve
