class Problem32

  def solve
    pans = []

    1.upto(99999) do |i|
      i.upto(9999) do |j|
        prod = i * j
        length, is_pan = is_pandigital i, j, prod
        break if length > 9

        if is_pan
          puts "#{i} x #{j} = #{prod}"
          pans << prod
        end
      end
    end

    total = 0
    pans.uniq.each do |p|
      total += p
    end

    puts total
  end

  def is_pandigital(i, j, prod)
    s = i.to_s + j.to_s + prod.to_s
    return s.length, false if s.length != 9
    chars = s.split(//).sort
    return 9, chars.join == "123456789"
  end

end

Problem32.new.solve