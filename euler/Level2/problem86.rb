require '../helper'
require '../primes'
require 'ostruct'

class Problem86
  def initialize
  end

  def count_upto(n)
    counts = Array.new(n+1).fill(0)
    errors = 0
    Primes.primitive_pythagorian_triples.each do |x, y, z|
      #puts "*** #{x}, #{y}, #{z}"
      i = 1
      while x*i <= n
        a, b, c = [x, y, z].map { |v| v*i }
        #puts "--> #{a}, #{b}, #{c}"
        count_single counts, a, b, c
        i += 1
      end
      if x > 100  ## <-- This is the issue... this isn't big enough, we need a better way to generate the triples in order
        errors += 1
        break if errors > n
      else
        errors = 0
      end
    end
    counts
  end

  def count_single(counts, a, b, c)
    [ [a,b], [b,a] ].each do |this, that|
      start = (this / 2.0).ceil
      finish = [ this-1, that ].min
      (start..finish).each do |i|
        j = this - i
        k = that
        max = [ i, j, k ].max
        next if max >= counts.length
        #puts sprintf(" - %3d, %3d, %3d - %3d", i, j, k, c)
        counts[max] += 1
      end
    end
  end

  def solve
    counts = count_upto 2000
    sum = 0
    counts.each_with_index do |c, i|
      sum += c
      if sum >= 1_000_000
        puts "SOLUTION: #{i} (#{sum})"
        break
      end
    end
  end

  def test
    assert 2060, count_upto(100).sum
  end
end

Problem86.new.test
puts
time { Problem86.new.solve }
