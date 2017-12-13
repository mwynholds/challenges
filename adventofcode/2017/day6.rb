require './helper'
require 'set'

class Day6

  def max_with_index(banks)
    max = [0, 0]
    banks.each_with_index do |val, i|
      max = [val, i] if val > max[0]
    end
    max
  end

  def iterate(banks)
    banks = banks.split.map(&:to_i)
    val, i = max_with_index banks
    banks[i] = 0
    val.times do
      i = (i + 1) % banks.length
      banks[i] += 1
    end
    banks.join ' '
  end

  def count(banks)
    banks = banks.split.join ' '
    count = 0
    seen = {}
    seen[banks] = count
    loop do
      banks = iterate banks
      count += 1
      break if seen.include? banks
      seen[banks] = count
    end
    [ count, count - seen[banks] ]
  end

  def solve
    banks = "4 10 4	1	8	4	9	14 5 1 14	15 0 15	3	5"
    puts count banks
  end

  def test
    assert "2 4 1 2", iterate("0 2 7 0")
    assert "3 1 2 3", iterate("2 4 1 2")
    assert "0 2 3 4", iterate("3 1 2 3")
    assert [5, 4], count("0 2 7 0")
  end

end

Day6.new.test
puts
Day6.new.solve
