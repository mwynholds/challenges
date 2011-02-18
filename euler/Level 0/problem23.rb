require 'helper'

class Problem23

  def solve
    puts "finding abundant numbers"
    abundant = []
    1.upto(28123) do |n|
      abundant << n if is_abundant(n)
    end
    puts "#{abundant.length} abundant numbers < 28123"

    puts "finding sums of abundant numbers"
    valid = [].fill(false, 0, 28123)

    0.upto(abundant.length - 1) do |i|
      i.upto(abundant.length - 1) do |j|
        sum = abundant[i] + abundant[j]
        valid[sum] = true unless sum > 28123
      end
    end
    valid.each_with_index do |v, i|
      puts i if v
    end

    puts "totaling all non-abundant-able sums"
    total = 0
    1.upto(28123) do |n|
      total += n unless valid[n]
    end

    puts total
  end

  def is_abundant(n)
    Helper.sum_divisors(n) > n
  end

end

Problem23.new.solve