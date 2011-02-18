require '../helper'

class Problem46

  def initialize
    @primes = []
  end

  def solve
    n = 2
    count = 0
    while true
      is_prime = Helper.is_prime(n)
      #puts "#{n} is #{is_prime ? '' : 'not'} prime"

      if is_prime
        @primes.unshift n
        n += 1
        next
      end

      if n % 2 == 0
        n += 1
        next
      end

      count += 1
      is_valid, prime, square = is_valid(n)

      if ! is_valid
        puts "Got it: #{n}"
        return
      else
        puts "(#{count}) : #{n} = #{prime} + 2x#{square}^2" if count % 10000 == 0
      end

      n += 1
    end
  end

  def is_valid(n)
    return false if @primes.empty?
    
    @primes.each do |prime|
      square = 1
      sum = 0
      begin
        sum = prime + (2 * square * square)
        return true, prime, square if sum == n
        square += 1
      end while sum <= n
    end

    return false
  end

end

Problem46.new.solve