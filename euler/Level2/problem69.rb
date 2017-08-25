require '../helper'
require '../primes'

class Problem69

  def initialize
  end

  def solve
    max = (2..1_000_000).pmap do |n|
      print '.' if n % 10000 == 0
      [n, n * 1.0 / n.totient]
    end.max_by { |n, val| val }
    p max
  end

  def test
    assert [13], 13.prime_factors.to_a
    assert [2, 7], 14.prime_factors.to_a
    assert 2, 4.totient
    assert 6, 7.totient
  end
end

class Integer

  def relatively_prime
  end
end

Problem69.new.test
puts
Problem69.new.solve
