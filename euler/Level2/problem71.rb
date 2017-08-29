require '../helper'
require '../primes'

class Problem71

  def initialize
  end

  def fractions(upto)
    (2..upto).map do |d|
      n = 3*d/7
      n == 0 ? nil : Rational(n, d)
    end.compact.uniq.sort
  end

  def solve
    p fractions(1_000_000).last(2)
  end

  def test
    assert [Rational(1, 4), Rational(1, 3), Rational(2, 5)], fractions(5)
  end
end

Problem71.new.test
puts
Problem71.new.solve
