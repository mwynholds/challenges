class Problem15

  def initialize
    @g = []
    (0..20).to_a.each do |i|
      @g[i] = []
      (0..20).to_a.each do |j|
        @g[i][j] = 0
      end
    end
  end

  def solve
    puts count(20, 20)
  end

  def count(i, j)
    return 1 if i == 0 && j == 0
    return @g[i][j] if @g[i][j] > 0

    return count(i, j-1) if i == 0
    return count(i-1, j) if j == 0

    c = count(i, j-1) + count(i-1, j)
    puts "#{i}, #{j} = #{c}"
    @g[i][j] = c
    c
  end

end

Problem15.new.solve