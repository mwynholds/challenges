require '../helper'

class Problem65
  def initialize
  end

  def sqrt2cf(n)
    Array.new(n).fill(2)
  end

  def ecf(n)
    Array.new(n).fill do |i|
      next 1 if i == 0
      next 2 if i == 1
      next 2*(((i-1)/3)+1) if (i-1) % 3 == 0
      1
    end
  end

  def converge(cf)
    first = cf[0]
    rest = cf[1..-1]
    if rest.length == 0
      #puts "Base case: return 1 / #{first}"
      Rational(1, first)
    else
      c = converge(rest)
      #puts "Return 1 / ( #{first} + #{c} )"
      Rational(1, first + c)
    end
  end

  def solve
    fraction = Rational(2) + converge(ecf(99))
    total = fraction.numerator.sum_digits
    puts "TOTAL: #{total}"
  end

  def test
    assert Rational(3, 2), Rational(1) + converge(sqrt2cf(1))
    assert Rational(7, 5), Rational(1) + converge(sqrt2cf(2))
    assert Rational(17, 12), Rational(1) + converge(sqrt2cf(3))
    assert Rational(3363, 2378), Rational(1) + converge(sqrt2cf(9))
    assert Rational(1457, 536), Rational(2) + converge(ecf(9))
  end
end

Problem65.new.test
puts
Problem65.new.solve
