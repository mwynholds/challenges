require '../helper'

class Problem53

  def ncr(n, r)
    n.fact / (r.fact * (n-r).fact)
  end

  def solve
    count = 0
    (1..100).each do |n|
      (1..n-1).each do |r|
        if ncr(n, r) > 1000000
          count += 1
        end
      end
    end

    puts count
  end
end

Problem53.new.solve
