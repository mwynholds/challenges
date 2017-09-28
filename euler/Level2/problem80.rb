require '../helper'

class Problem80

  def initialize
  end

  def sum100(n)
    sqrt = sqrt(n, 100)
    sqrt.sum
  end

  def sqrt(n, max)
    root = []
    p = 0
    remainder = 0
    pairs(n, max).each do |pair|
      c = remainder * 100 + pair
      x = find_x p, c
      y = x * (20 * p + x)
      #puts "x: #{x}, y: #{y}, c: #{c}"
      root << x
      p = p * 10 + x
      remainder = c - y
      break if remainder == 0
    end
    root[0..max-1]
  end

  def pairs(n, max)
    whole = n.digits.reverse
    whole = [0] + whole if whole.length % 2 == 1
    fractional = Array.new(max*2).fill(0)
    digits = whole + fractional
    digits.each_slice(2).map { |x, y| x * 10 + y }
  end

  def find_x(p, c)
    (0..9).each do |x|
      y = x * (20 * p + x)
      return x-1 if y > c
    end
    9
  end

  def solve
    sum = 0
    (1..100).each do |i|
      next if i.square?
      sum += sum100(i)
    end
    puts "TOTAL: #{sum}"
  end

  def test
    assert [2, 0, 0, 0], pairs(2, 3).to_a
    assert [2, 0, 0, 0, 0], pairs(2, 4).to_a
    assert [12, 0, 0, 0], pairs(12, 3).to_a
    assert [5], sqrt(25, 5)
    assert [1, 4, 1, 4, 2], sqrt(2, 5)
    assert [1, 4, 1, 4, 2, 1, 3, 5, 6, 2, 3, 7, 3, 0, 9, 5, 0, 4, 8, 8], sqrt(2, 20)
    assert 1414213562373095048801688724209698078569671875376948073176679737990732478462107038850387534327641572.digits.reverse, sqrt(2, 100)
    assert 475, sum100(2)
  end
end

Problem80.new.test
puts
Problem80.new.solve
