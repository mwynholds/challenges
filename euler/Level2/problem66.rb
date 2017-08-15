require '../helper'
require '../continued_fraction'

class Problem66
  def minimal(d)
    cf = ContinuedFraction.new d
    cvs = cf.convergents
    cv = nil
    loop do
      cv = cvs.next
      x = cv.numerator
      y = cv.denominator
      if x**2 - d * y**2 == 1
        return [ d, x, y ]
      end
    end
  end

  def largest_x(max_d)
    (2..max_d).reject(&:square?).map { |d| minimal d }.max_by { |d, x, y| x }
  end

  def solve
    largest = largest_x(1000)
    puts
    puts "Max: #{largest}"
  end

  def test
    assert 1, ContinuedFraction.new(2).first
    assert [2, 2, 2, 2], ContinuedFraction.new(2).expansion.take(4)
    assert 4, ContinuedFraction.new(23).first
    assert [1, 3, 1, 8, 1, 3, 1, 8], ContinuedFraction.new(23).expansion.take(8)

    assert [ Rational(3, 2), Rational(7, 5), Rational(17, 12) ], ContinuedFraction.new(2).convergents.take(3)

    assert [13, 649, 180], minimal(13)
    assert [61, 1766319049, 226153980], minimal(61)
    assert [5, 9, 4], largest_x(7)
  end
end

Problem66.new.test
puts
Problem66.new.solve
