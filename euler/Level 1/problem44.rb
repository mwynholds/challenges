class Problem44

  def solve

    puts "should be true: #{is_pentagonal?(145, 3)}"

    max = 10000
    cache = []

    2.upto(max) do |i|
      pi = pentagonal(i)
      cache[pi] = true

      1.upto(i) do |j|
        pj = pentagonal(j)
        diff = pi - pj

        if cache[diff]
          #puts "halfway there with: #{i} x #{j}"
          sum = pi + pj
          if is_pentagonal?(sum, i+1)
            puts "got one: diff = #{diff}"
          end
        end
      end
    end


  end

  def pentagonal(n)
    ((n * (3*n - 1)) / 2).to_i
  end

  def is_pentagonal?(n, start)
    p = 0
    i = start
    while p <= n
      p = pentagonal(i)
      return true if p == n
      i += 1
    end

    false
  end

end

Problem44.new.solve