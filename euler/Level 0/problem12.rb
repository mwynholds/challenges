class Problem12

  def solve
    triangle = 0
    count = 1

    while true do
      triangle += count
      count += 1
      divisors = count_divisors(triangle)
      puts "#{triangle}: #{divisors}" if count % 100 == 0
      if divisors > 500
        puts triangle
        return
      end
    end
  end

  def count_divisors(n)
    count = 0
    sqrt = Math.sqrt(n).to_i + 1
    1.upto(sqrt) do |i|
      count += 2 if n % i == 0
    end
    count
  end

  Problem12.new.solve
end