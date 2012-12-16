require '../helper'

class Problem43

  def solve
    sum = 0
    %w(0 1 2 3 4 5 6 7 8 9).each_permutation do |a|
      pan = a.join.to_i
      if sub(pan, 2, 3) % 2 == 0 &&
         sub(pan, 3, 3) % 3 == 0 &&
         sub(pan, 4, 3) % 5 == 0 &&
         sub(pan, 5, 3) % 7 == 0 &&
         sub(pan, 6, 3) % 11 == 0 &&
         sub(pan, 7, 3) % 13 == 0 &&
         sub(pan, 8, 3) % 17 == 0

        puts "found one: #{pan}"
        sum += pan
      end
    end

    puts "total: #{sum}"
  end

  def sub(n, start, length)
    n.to_s[start-1, length].to_i
  end

end

Problem43.new.solve