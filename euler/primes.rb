require '../helper'

class Primes

  def self.is_prime(n)
    n.prime?
  end

end

class Integer
  def prime_divisors
    divisors.select {|i| i.prime?}
  end

  def prime?
    return false if self == 0 || self == 1
    @@primes ||= []
    return @@primes[self] if @@primes[self]

    sqrt = Math.sqrt(self.abs).to_i
    2.upto(sqrt) do |i|
      if self % i == 0
        @@primes[self] = false
        return false
      end
    end

    @@primes[self] = true
    true
  end

  def next_prime
    n = self
    while n == self || !n.prime?
      n = n + ( n <= 2 ? 1 : 2 )
    end
    n
  end

end
