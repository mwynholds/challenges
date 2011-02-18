class Problem25

  def solve
    count = 2
    fn1 = 1
    fn2 = 1
    fn = 0
    while fn.to_s.length < 1000
      fn = fn1 + fn2
      count += 1
      fn2 = fn1
      fn1 = fn
    end

    puts count
  end

end

Problem25.new.solve