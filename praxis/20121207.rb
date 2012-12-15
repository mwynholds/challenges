require 'set'

class Challenge
  def initialize
  end

  def solve(max = 100)
    a = SortedSet.new [1]
    b = []
    while b.length < max
      x = a.to_a[0]
      y = 2 * x + 1
      z = 3 * x + 1
      b << x
      a.delete(x) << y << z
    end
    p b
  end
end

Challenge.new.solve 200
