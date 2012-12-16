class Problem16

  def solve
    big = 2 ** 1000
    sum = 0
    big.to_s.each_char { |c| sum += c.to_i }
    puts sum
  end

end

Problem16.new.solve