class Problem45

  def initialize
    @t = { :n => 0, :T => 0 }
    @p = { :n => 0, :P => 0 }
  end

  def solve
    n = 1
    while true
      h = n * (2*n - 1)
      if is_tri?(h) && is_pen?(h)
        puts "got one: #{h}"
      end
      n += 1
    end
  end

  def is_tri?(h)
    while @t[:T] <= h
      return true if @t[:T] == h
      n = @t[:n]
      @t = { :n => n+1, :T => ((n * (n + 1)) / 2).to_i }
    end

    false
  end

  def is_pen?(h)
    while @p[:P] <= h
      return true if @p[:P] == h
      n = @p[:n]
      @p = { :n => n+1, :P => ((n * (3*n - 1)) / 2).to_i }
    end

    false
  end

end

Problem45.new.solve