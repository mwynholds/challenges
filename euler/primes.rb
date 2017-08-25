require '../helper'
require 'set'

class Primes

  def self.is_prime(n)
    n.prime?
  end

end

class Integer
  def self.all_primes
    Enumerator.new do |yielder|
      p = 2
      loop do
        yielder << p
        p = p.next_prime
      end
    end
  end

  def prime_factors
    return [1] if self == 1

    @@prime_factors ||= []
    return @@prime_factors[self] if @@prime_factors[self]

    if self.prime?
      @@prime_factors[self] = [self]
      return @@prime_factors[self]
    end

    first_prime = Integer.all_primes.find { |p| self % p == 0 }
    pfs = [first_prime] + (self / first_prime).prime_factors
    @@prime_factors[self] = pfs
    pfs
  end

  def relatively_prime_factors
    self.prime_factors.freq.map { |factor, count| factor**count }
  end

  def relatively_prime_with(n)
    Set.new(self.prime_factors).intersection(Set.new(n.prime_factors)).empty?
  end

  def totient
    pfs = self.prime_factors
    rpfs = self.relatively_prime_factors
    if rpfs.length == 1
      return self - 1 if self.prime?
      return pfs.map.with_index { |pf, i| i == 0 ? pf-1 : pf }.reduce(1, &:*)
    else
      return rpfs.map { |rpf| rpf.totient }.reduce(1, &:*)
    end
  end

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
