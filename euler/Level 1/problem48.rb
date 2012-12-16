class Problem48
  def solve(n)
    sum = 0
    1.upto(n) do |i|
      sum += i**i
    end
    p sum
  end
end

Problem48.new.solve 1000
