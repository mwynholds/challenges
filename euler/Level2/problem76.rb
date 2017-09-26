require '../helper'

class Problem76

  def initialize
    @found = 0
  end

  def count(n)
    puts "counting for #{n}"
    children(n, 1).sum { |child| count_pair(child) }
  end

  def count_pair(pair )
    @found += 1
    print '.' if @found % 100000 == 0
    children = children pair[0], pair[1]
    1 + children.sum { |child| count_pair child }
  end

  def children(n, min)
    mid = n % 2 == 0 ? n/2 : n/2+1
    (mid..n-min).map { |i| [i, n-i] }.reverse
  end

  def solve
    puts count(10)
    puts count(20)
    puts count(30)
    puts count(40)
    puts count(50)
    puts count(60)
    puts count(70)
    puts count(80)
    puts count(90)
    puts count(100)
  end

  def test
    assert [ [4,1], [3,2] ], children(5, 1)
    assert [ [4,2], [3,3] ], children(6, 2)
    assert [ [6,2], [5,3], [4,4] ], children(8, 2)
    assert 4, count(4)
    assert 6, count(5)
    assert 10, count(6)
    assert 14, count(7)
  end
end

Problem76.new.test
puts
Problem76.new.solve
