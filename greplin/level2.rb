class Fixnum
  def prime?
    return false if self == 0 || self == 1

    sqrt = Math.sqrt(abs).to_i
    2.upto(sqrt) do |i|
      return false if self % i == 0
    end

    true
  end

  def divisors
    sqrt = Math.sqrt(self).to_i
    divs = []
    2.upto(sqrt) do |i|
      if self % i == 0
        divs << i
        divs << self/i unless i == self/i
      end
    end
    divs
  end

  def prime_divisors
    divisors.select(&:prime?)
  end
end

@fibber = Fiber.new do
  x,y = 0,1
  loop do
    Fiber.yield y
    x,y = y,x+y
  end
end

def next_prime_fib(n)
  fib = 0
  fib = @fibber.resume until fib > n

  while !fib.prime?
    fib = @fibber.resume
  end

  fib
end

fib = next_prime_fib(227000)
#puts fib
divs = (fib + 1).prime_divisors
#puts divs.sort.join(" ")
puts divs.reduce(&:+)
