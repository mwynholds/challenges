require '../helper'
require '../primes'

class Problem70

  def initialize
  end

  def solve
    print "Calculating 10,000,000 totients..."
    totients = Integer.totients_up_to(10**7)
    puts " done"
    print "Finding minimal ratio for permutations... "
    min = totients.pmap_with_index do |t, n|
      print '.' if n % 100000 == 0
      next nil if n == 0 || n == 1
      if n.permutation? t
        { n: n, r: n*1.0/t }
      else
        nil
      end
    end.compact.min_by { |v| v[:r] }
    puts " done"
    p min
  end

  def test
    assert [2, 3, 5, 7], Primes.up_to(9)
    assert [nil, 1, 1, 2, 2, 4, 2, 6, 4, 6, 4], Integer.totients_up_to(10)
    assert true, 5834987.permutation?(4783598)
    assert false, 5834987.permutation?(4783698)
  end
end

Problem70.new.test
puts
Problem70.new.solve
