require '../helper'

class Problem36

  def solve
    total = 0
    1.upto(999999) do |n|
      if Helper.is_palindrome(n.to_s) and Helper.is_palindrome(n.to_s(2))
        puts "#{n.to_s} - #{n.to_s(2)}"
        total += n
      end
    end

    puts "solution: #{total}"
  end

end

Problem36.new.solve