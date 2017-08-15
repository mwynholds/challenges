require '../helper'
require '../continued_fraction'
require 'bigdecimal'

class Problem64
  def initialize
  end

  def first(n)
    a = Math.sqrt(n).floor
    b = 1
    c = a
    [ a, b, c ]
  end

  def rest(n, b, c)
    x = b
    y = c
    z = n - c**2

    b1 = z / x
    a1 = 0
    c1 = y
    loop do
      a1 += 1
      c1 -= b1
      break if (c1-b1)**2 > n
    end
    c1 = -c1
    [ a1, b1, c1 ]
  end

  def fill(n, sequence)
    (1..400).each do
      (_, b, c) = sequence.last
      sequence <<  rest(n, b, c)
    end
  end

  def len(array, str)
    array_len = 0
    str_len = 0
    array.each do |n|
      array_len += 1
      str_len += n.to_s.length
      break if str_len == str.length
    end
    array_len
  end

  def solve
    odd = []
    (2..10000).each do |n|
      next if n.square?

      sequence = [ first(n) ]
      loop do
        fill n, sequence
        array = sequence.map { |(a, _, _, _)| a }[1..-1]
        str = array.join ''
        pattern = str.match(/^(\d+?)\1{40}\d*$/)
        if pattern
          print '.' if n % 10 == 0
          length = len array, pattern[1]
          #puts "#{n} - #{pattern[1]} (#{length}) - #{str}"
          #puts "#{n} - #{pattern[1]} (#{length})"
          odd << n if length % 2 == 1
          break
        end
      end
    end
    puts "TOTAL - #{odd.length}"
  end

  def test
  end
end

Problem64.new.test
puts
Problem64.new.solve
