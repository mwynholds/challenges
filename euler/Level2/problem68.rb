require '../helper'

=begin

      g
       \
      __a__    f
    /      \ /
   b        e
 /  \      /
h    c -- d -- j
      \
       i

=end

class Problem68

  def initialize
  end

  def solve_for(sides, sum, inner_select = nil, solution_select = nil)
    inner_select ||= Proc.new { true }
    solution_select ||= Proc.new { true }
    range = 1..sides*2
    inners = range.to_a.permutation(sides).select(&inner_select)
    inners.pmap do |inner|
      available = range.to_a - inner
      outer = inner.map.with_index do |x, i|
        y = inner[(i+1)%sides]
        available.delete(sum - x - y)
      end
      outer.include?(nil) ? nil : Solution.new(inner, outer)
    end.compact.uniq { |s| s.numeric }.select(&solution_select)
  end

  def max_for(sides, inner_select = nil, solution_select = nil)
    range = 1..sides*2
    min = range.first(3).sum
    max = range.last(3).sum
    (min..max).pmap { |n| solve_for(sides, n, inner_select, solution_select) }.flatten.map(&:numeric).max
  end

  def solve
    no10 = Proc.new { |i| ! i.include? 10 }
    digit16 = Proc.new { |s| s.numeric.to_s.length == 16 }
    puts max_for(5, no10, digit16)
  end

  def test
    assert [ 423531612, 432621513 ], solve_for(3, 9).map(&:numeric).sort
    assert [ 235451613, 253631415 ], solve_for(3, 10).map(&:numeric).sort
    assert 432621513, max_for(3)
    assert 253631415, max_for(3, nil, Proc.new { |s| s.numeric.to_s[0] == '2' })
  end
end

class Solution
  def initialize(inner, outer)
    @inner = inner
    @outer = outer
  end

  def numeric
    index = @outer.index @outer.min
    router = @outer.rotate index
    rinner = @inner.rotate index
    router.map.with_index do |o, i|
      [ o, rinner[i], rinner[(i+1)%rinner.length] ]
    end.flatten.join('').to_i
  end

  def to_s

  end
end

Problem68.new.test
puts
Problem68.new.solve
