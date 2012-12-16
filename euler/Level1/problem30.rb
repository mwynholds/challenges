class Problem30

  def solve
    total = 0
    10.upto(1000000) do |n|
      sum = find_sum(n)
      if sum == n
        puts "#{n} : #{sum}"
        total += sum
      else
        #puts "#{n} : #{sum}"
      end
    end

    puts total
  end

  def find_sum(n)
    sum = 0
    n.to_s.each_char do |c|
      sum += c.to_i ** 5
    end
    sum
  end

end

Problem30.new.solve