class Challenge
  def initialize
  end

  def solve(n)
    max = ((n/2+1) ** (1.0/3)).floor
    (1..max).each do |i|
      i3 = i**3
      diff = n - i3
      if diff > 0
        j = diff ** (1.0/3)
        if j.ceil ** 3 == diff
          j = j.ceil
          puts "#{i}^3 + #{j}^3 = #{n}"
        end
      end
    end
  end
end

Challenge.new.solve 1729
