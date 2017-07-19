require '../helper'
require '../primes'

class Problem58
  def initialize
    @diagonals = [1]
    @primes = []
  end

  def diagonals_for(n)
    throw "#{n} must be odd" unless n % 2 == 1
    [ n*n-(n-1)*3, n*n-(n-1)*2, n*n-(n-1), n*n ]
  end

  def update_for(n)
    diagonals = diagonals_for n
    primes = diagonals.select { |d| d.prime? }
    @diagonals += diagonals
    @primes += primes
  end

  def solve
    side = 1
    pct = 1
    while pct >= 0.1
      side += 2
      update_for side
      pct = @primes.length * 1.0 / @diagonals.length
      #puts "#{side}: #{pct}"
    end

    puts "SOLUTION: #{side}: #{pct}"
  end

  def test
    update_for 3
    update_for 5
    update_for 7
    assert 8, @primes.length
    assert 13, @diagonals.length
  end
end

Problem58.new.test
puts
Problem58.new.solve
