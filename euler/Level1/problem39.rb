class Problem39

  def solve
    max = {:p => 0, :count => 0}
    3.upto(1000) do |p|
      count = count_triangles(p)
      if count > max[:count]
        max = {:p => p, :count => count}
      end
    end

    puts "max: #{max}"
  end

  def count_triangles(p)
    count = 0
    1.upto(p) do |a|
      a.upto(p-a) do |b|
        c = p - a - b
        if a**2 + b**2 == c**2
          puts "#{p} = {#{a}, #{b}, #{c}}"
          count += 1
        end
      end
    end

    count
  end

end

Problem39.new.solve