require '../helper'

class Problem27

  def solve
    max = [0, 0, 0]
    -999.upto(999) do |a|
      -999.upto(999) do |b|
        count = count_primes(a, b)

        if count > max[2]
          puts "Found #{count} primes for #{a}, #{b}"
          max = [a, b, count]
        end
      end
    end

    puts "Solution: #{max[0]} x #{max[1]} = #{max[0] * max[1]}"
  end

  def count_primes(a, b)
    #puts "counting primes for #{a}, #{b}"
    n = -1
    prime = true
    while prime
      n += 1
      quad = n**2 + a*n + b
      prime = Helper.is_prime(quad)
    end

    n
  end

end

Problem27.new.solve