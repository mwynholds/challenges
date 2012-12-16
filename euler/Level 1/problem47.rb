require '../helper'

class Problem47

  def solve(n)
    solution = []
    i = 1
    while solution.length < n
      if i.prime_divisors.length == n
        solution = [] unless solution.empty? || i == solution.last + 1
        solution << i
      end
      i += 1
    end
    p solution
  end

end

Problem47.new.solve 4
