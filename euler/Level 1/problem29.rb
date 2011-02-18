class Problem29

  def solve
    n = 100

    all = []
    2.upto(n) do |a|
      2.upto(n) do |b|
        all << a**b
      end
    end
    puts all.uniq.length
  end

end

Problem29.new.solve