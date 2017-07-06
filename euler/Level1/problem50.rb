require '../helper'

class Problem50
  MAX = 1000000

  def find_longest(n, max)
    primes = [n, n.next_prime]
    best = [n]
    while
      sum = primes.sum
      break if sum >= max
      best = primes.dup if sum.prime?
      primes = primes << primes.last.next_prime
    end
    best
  end

  def solve
    i = 0
    n = 2
    max = []
    while n < MAX
      longest = find_longest n, MAX
      max = longest if longest.length > max.length
      n = n.next_prime
      i += 1
      print "." if i % 500 == 0
    end

    puts
    p max.sum
  end
end

Problem50.new.solve
