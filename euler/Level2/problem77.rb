require '../helper'
require '../primes'

class Problem77

  def initialize
    @found = 0
    @primes = Array.new(10001)
    Primes.up_to(10000).each { |p| @primes[p] = true }
  end

  def count(n)
    puts "counting for #{n}"
    children(n, 1).sum { |child| count_pair(child, []) }
  end

  def count_pair(pair, uncles)
    soln = pair + uncles
    point = soln.all? { |n| @primes[n] } ? 1 : 0

    if point == 1
      @found += 1
      print '.' if @found % 100000 == 0
      #puts soln.join("+")
    end

    children = children pair[0], pair[1]
    point + children.sum { |child| count_pair child, uncles + [ pair[1] ] }
  end

  def children(n, min)
    mid = n % 2 == 0 ? n/2 : n/2+1
    (mid..n-min).map { |i| [i, n-i] }.reverse
  end

  def solve
    n = 65
    loop do
      c = count n
      puts c
      if c > 5000
        puts "SOLUTION: #{n}"
        break
      end
      n += 1
    end
  end

  def test
    assert 5, count(10)
  end
end

Problem77.new.test
puts
Problem77.new.solve
