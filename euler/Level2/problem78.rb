require '../helper'

class Problem78

  def initialize
  end

  def solve
    n = 1
    loop do
      print '.' if n % 10000 == 0
      p = n.partitions
      if p % 1_000_000 == 0
        puts "SOLUTIONS: #{n} - #{p}"
        break
      end
      n += 1
    end
  end

  def test
  end
end

Problem78.new.test
puts
Problem78.new.solve
