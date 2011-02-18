class Problem21

  def solve
    total = 0
    2.upto(9999) do |i|
      s1 = sum_divisors(i)
      s2 = sum_divisors(s1)

      if s2 == i && s1 != i
        puts "amicable: #{i}"
        total += i
      end

    end
    puts total
  end

  def sum_divisors(n)
    sum = 1
    sqrt = Math.sqrt(n).to_i + 1
    2.upto(sqrt) do |i|
      sum += (i + n/i) if n % i == 0
    end
    sum
  end
end

Problem21.new.solve