require '../helper'
require '../primes'
require 'set'

class Problem87
  def initialize
  end

  def highest(n, power)
    (n ** (1.0/power)).floor
  end

  def count(n)
    found = Set.new
    h4 = highest n, 4
    Primes.up_to(h4).each do |c|
      puts c
      h3 = highest n-c**4, 3
      Primes.up_to(h3).each do |b|
        h2 = highest n-c**4-b**3, 2
        Primes.up_to(h2).each do |a|
          sum = a**2 + b**3 + c**4
          #puts "#{a}^2 + #{b}^3 + #{c}^4 = #{sum}"
          found << sum
        end
      end
    end
    found.length
  end

  def solve
    puts "SOLUTION: #{count(50_000_000)}"
  end

  def test
    assert 4, count(50)
  end
end

Problem87.new.test
puts
time { Problem87.new.solve }
