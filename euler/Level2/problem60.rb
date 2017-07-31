require '../helper'
require '../primes'

class Problem60
  def initialize
    @count = 1
    @current = 2
    @successes = [ [ @current ] ]
  end

  def success?(primes)
    return false if primes.length == 0
    primes.product(primes).reject { |(a,b)| a == b }.all? do |(a, b)|
      "#{a}#{b}".to_i.prime?
    end
  end

  def add_next_prime
    @count += 1
    @current = @current.next_prime
    @successes += ( @successes.product([ @current ]).map { |s| s.flatten } + [ [ @current ] ] ).select { |s| success? s }
    #puts "#{@current} - #{@successes.length}"
    print '.' if @count % 10 == 0
  end

  def lowest(n)
    loop do
      add_next_prime
      solutions = @successes.select { |s| s.length == n }
      return solutions.min { |a,b| a.sum <=> b.sum } if solutions.length > 0
    end
  end

  def solve
    lowest = lowest 5
    p lowest
    puts lowest.sum
  end

  def test
    assert true, success?([ 3, 7, 109, 673 ])
    assert false, success?([ 5, 7, 109, 673 ])
    assert [3, 7, 109, 673], lowest(4)
  end
end

Problem60.new.test
puts
Problem60.new.solve
