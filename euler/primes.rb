require '../helper'
require 'set'
require 'prime'

class Primes

  def self.is_prime(n)
    n.prime?
  end

  def self.up_to(n)
    Prime::EratosthenesGenerator.new.take_while { |p| p <= n }
  end

  def self.coprimes(even_odd = true, odd_odd = true)
    current = [ ]
    current << [2, 1] if even_odd
    current << [3, 1] if odd_odd
    Enumerator.new do |yielder|
      loop do
        first = current.shift
        yielder << first
        first.tap do |m, n|
          [ [2*m-n, m], [2*m+n, m], [m+2*n, n] ].each do |(a, b)|
            i = current.bsearch_index { |(c, d)| c+d > a+b } || -1
            current.insert i, [a, b]
          end
        end
      end
    end
  end

  def self.primitive_pythagorian_triples
    cps = coprimes true, false
    Enumerator.new do |yielder|
      loop do
        (m, n) = cps.next
        yielder << [ m**2-n**2, 2*m*n, m**2+n**2 ].sort
      end
    end
  end

end

class Integer
  def multiples
    Enumerator.new do |yielder|
      count = 1
      loop do
        yielder << (self * count)
        count += 1
      end
    end
  end

  def prime_factors
    Prime.prime_division self
  end

  def relatively_prime_factors
    prime_factors.pmap { |p, e| p**e }
  end

  def totient
    self * ( prime_factors.map { |p, e| 1 - 1.0 / p }.reduce(1, &:*) )
  end

  def self.totients_up_to(n)
    results = (0..n).to_a
    results[1] = 0
    primes = Primes.up_to n
    primes.each do |prime|
      prime.multiples.each do |m|
        break if m > n
        results[m] = (results[m] / prime) * (prime - 1)
      end
    end
    results
  end

  def prime_divisors
    divisors.select {|i| i.prime?}
  end

  def prime?
    Prime.prime? self
  end

  def next_prime
    n = self
    while n == self || !n.prime?
      n = n + ( n <= 2 ? 1 : 2 )
    end
    n
  end

end
