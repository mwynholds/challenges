require '../helper'

class Problem34

  def solve
    total = 0
    10.upto(2600000) do |n|
      c = curious(n)
      if n % 100000 == 0
        puts "trying: #{n}"
      end
      if c == n
        puts "!! curious: #{n}"
        total += n
      end
    end

    puts "total: #{total}"
  end

  def curious(n)
    total = 0
    n.to_s.each_char do |c|
      total += Helper.bang(c.to_i)
    end
    total
  end

end

Problem34.new.solve