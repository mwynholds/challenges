require '../helper'

class Problem41

  def solve

    digits = %w(1 2 3 4 5 6 7 8 9)
    max = 0
    while digits.length >= 2
      puts "using digits: #{digits.inspect}"
      digits.each_permutation do |a|
        pan = a.join.to_i
        if Helper.is_prime(pan)
          puts "got one: #{pan}"
          max = [max, pan].max
        end
      end
      digits.pop
    end

    puts "max: #{max}"
  end

end

Problem41.new.solve