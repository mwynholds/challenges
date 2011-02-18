class Problem14

  def solve
    max = 0
    max_length = 0
    (1..1000000).to_a.each do |n|
      length = chain_length n
      if length > max_length
        max = n
        max_length = length
      end

      puts "#{n}: #{max} (#{max_length})" if n % 1000 == 0
    end

    puts "SOLUTION: #{max} (#{max_length})"
  end

  def chain_length(n)
    count = 1
    while n != 1 do
      if n % 2 == 0
        n = n/2
      else
        n = n*3 + 1
      end

      count += 1
    end
    count
  end

end

Problem14.new.solve