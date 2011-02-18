class Problem28

  def solve
    n = 1001
    spiral = create_spiral(n)
    sum = 0
    0.upto(n-1) do |i|
      sum += spiral[i][i]
      sum += spiral[i][n-1-i] unless i == n-1-i
    end
    puts sum
  end

  def create_spiral(n)
    spiral = []
    0.upto(n-1) do |i|
      spiral << []
    end

    x, y = n/2, n/2
    val = 1
    while val <= n ** 2
      spiral[x][y] = val
      x, y = advance(x, y, val)
      val += 1
    end

    spiral
  end

  def advance(x, y, val)
    upper_corner = Math.sqrt(val).to_i
    upper_corner -= ( upper_corner % 2 == 0 ? 1 : 0 )
    upper_corner = upper_corner ** 2

    incr = Math.sqrt(upper_corner).to_i + 1

    return x+1, y if val == upper_corner
    return x, y+1 if val < upper_corner + 1*incr
    return x-1, y if val < upper_corner + 2*incr
    return x, y-1 if val < upper_corner + 3*incr
    return x+1, y
  end

end

Problem28.new.solve