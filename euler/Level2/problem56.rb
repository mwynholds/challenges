require '../helper'

class Problem56
  def solve
    max = (1..99).to_a.product((1..99).to_a).max_by do |(a,b)|
      (a**b).sum_digits
    end
    puts "#{max} - #{(max[0]**max[1]).sum_digits}"
  end

  def test
  end
end

Problem56.new.test
puts
Problem56.new.solve
