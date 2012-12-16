class Problem113Brute

  def solve
    digits = 6

    total = up = down = 0
    (1...10**digits).each do |n|
      u = false
      if is_up?(n)
        up += 1
        u = true
      end

      d = false
      if is_down?(n)
        down += 1
        d = true
      end

      puts n if n % 100000 == 0

#      if u && d
#        puts "pal: #{n}"
#      end
    end
    overlap = 9 * digits
    #overlap = 0
    total = up + down - overlap

    puts "#{up} + #{down} - #{overlap} = #{total}"
  end

  def is_up?(n)
    last = 0
    n.to_s.split(//).each do |d|
      return false if d.to_i < last
      last = d.to_i
    end

    true
  end

  def is_down?(n)
    last = 9
    n.to_s.split(//).each do |d|
      return false if d.to_i > last
      last = d.to_i
    end

    true
  end

end

Problem113Brute.new.solve