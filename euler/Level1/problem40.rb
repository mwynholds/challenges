class Problem40

  def solve
    d = "0"
    i = 1
    while d.length < 1000001
      d << i.to_s
      i += 1
    end

    puts d[1, 100]
    puts d[1, 1]
    puts d[10, 1]
    answer = d[1, 1].to_i * d[10, 1].to_i * d[100, 1].to_i * d[1000, 1].to_i * d[10000, 1].to_i * d[100000, 1].to_i * d[1000000, 1].to_i
    puts answer
  end

end

Problem40.new.solve