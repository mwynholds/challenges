require '../helper'

class Problem38

  def solve
    max = 0
    2.upto(9) do |n|
      i = 1
      prod = 0
      while prod <= 987654321
        prod = mult(n, i)
        if Helper.is_pandigital(prod)
          puts "#{i} x (1..#{n}) = #{prod}"
          max = [max, prod].max
        end
        i += 1
      end
    end

    puts "max: #{max}"
  end

  def mult(n, i)
    prod = ""
    1.upto(n) do |c|
      prod << (c*i).to_s
    end
    prod.to_i
  end

end

Problem38.new.solve