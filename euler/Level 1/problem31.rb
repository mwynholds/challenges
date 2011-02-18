class Problem31

  def solve
    @wins = 0
    coins = [ 200, 100, 50, 20, 10, 5, 2, 1 ]
    #coins = [ 4, 3, 2, 1 ]
    r([], coins)
    puts "SOLUTION: #{@wins}"
  end

  def r(buffer, coins)
    sum = s buffer

    #puts "RUNNING: #{buffer.inspect} - #{coins.inspect} = #{sum}"
    #printf "%3d - %s\n", sum, buffer.inspect
    #sleep 0.1

    if sum >= 200
      win buffer if sum == 200
      return
    end

    coins.each_with_index do |c, i|
      buffer.push(c)
      r(buffer, coins[i..coins.length-1])
      buffer.pop
    end
  end

  def s(buffer)
    sum = 0
    buffer.each { |c| sum += c }
    sum
  end

  def win(buffer)
    #puts "WIN: #{buffer.inspect}"
    @wins += 1
  end

end

Problem31.new.solve