require '../helper'
require '../primes'

class Problem73

  def initialize
  end

  def fractions(upto)
    (2..upto).pmap do |d|
      print '.' if d % 120 == 0
      bottom_n = d/3
      top_n = d/2+1
      (bottom_n..top_n).map do |n|
        next nil if n == 0
        r = Rational(n, d)
        next nil if r <= Rational(1, 3)
        next nil if r >= Rational(1, 2)
        r
      end
    end.flatten.compact.uniq
  end

  def solve
    puts fractions(12_000).length
  end

  def test
    assert [Rational(3, 8), Rational(2, 5), Rational(3, 7)], fractions(8).sort
  end
end

Problem73.new.test
puts
Problem73.new.solve
