class Problem113Copy
  N = 9

  def solve
    pos = [1,1,1,1,1,1,1,1,1,1]

    inc = 0
    dec = 0

    (N-1).times do
      pos = (0..9).map { |i|
        pos[i..9].inject { |n,sum| sum+n }
      }
      inc += pos[1..9].inject { |n, sum| sum+n }
      dec += pos[0..8].inject { |n, sum| sum+n }
    end

    eq = (N-2) * 9

    puts inc + dec - eq
  end

end

time1 = Time.now
10.times { Problem113Copy.new.solve }
time2 = Time.now
puts "Time: #{time2.to_f - time1.to_f}s"