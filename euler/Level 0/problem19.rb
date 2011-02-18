class Problem19

  def solve
    total = 0
    d = Time.local(1901, "jan", 1)
    while d.year <= 2000
      total += 1 if d.mday == 1 && d.wday == 0
      d += ( 60 * 60 * 24 )
    end
    puts total
  end

end

Problem19.new.solve