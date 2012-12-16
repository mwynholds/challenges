class Problem20

  def solve
    n100 = pow(100)
    total = 0
    n100.to_s.each_char do |c|
      total += c.to_i
    end
    puts total
  end

  def pow(n)
    return 1 if n == 1
    return n * pow(n-1)
  end

end

Problem20.new.solve