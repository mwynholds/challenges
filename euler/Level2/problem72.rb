require '../helper'
require '../primes'

class Problem72

  def initialize
  end

  def brute(max)
    (2..max).map do |d|
      (1..d-1).map do |n|
        Rational(n, d)
      end
    end.flatten.uniq
  end

  def count_for(max)
    totients = Integer.totients_up_to max
    totients.sum
  end

  def solve
    puts count_for(1_000_000)
  end

  def test
    assert 21, count_for(8)
    assert 21, brute(8).length
    assert brute(16).length, count_for(16)
    assert brute(100).length, count_for(100)
  end
end

Problem72.new.test
puts
Problem72.new.solve
