class Integer
  @@partitions_cache = {}

  def sum_digits
    to_s.split(//).map(&:to_i).sum
  end

  def num_digits
    to_s.length
  end

  def divisors
    sqrt = Math.sqrt(self).to_i
    divisors = [1]
    2.upto(sqrt) do |i|
      if self % i == 0
        j = self / i
        divisors << i
        divisors << j unless i == j
      end
    end
    divisors.sort
  end

  def canonical_digits
    self.to_s.split(//).sort.to_s
  end

  def fact
    (1..self).reduce(:*) || 1
  end

  def fact_sum
    digits.map(&:fact).sum
  end

  def palindrome?
    to_s == reverse.to_s
  end

  def permutation2?(i)
    self.to_s.split('').sort == i.to_s.split('').sort
  end

  def permutation?(i)
    idigits = i.digits
    self.digits.each do |digit|
      index = idigits.index digit
      return false unless index
      idigits.delete_at index
    end
    idigits.empty?
  end

  def reverse
    to_s.reverse.to_i
  end

  def primes_below
    primes = [ 2 ]
    primes << primes.last.next_prime until primes.last >= self
    primes[0..-1]
  end

  def partitions
    return 0 if self < 0
    return 1 if self == 0
    return @@partitions_cache[self] if @@partitions_cache[self]
    sum = 0
    m = 0
    loop do
      m += 1
      c = m*(3*m-1)/2
      m2 = -m
      c2 = m2*(3*m2-1)/2
      break if self-c < 0 && self-c2 < 0
      sign = (-1)**(m-1)
      sum += ( sign * (self-c).partitions ) + ( sign * (self-c2).partitions )
    end
    #puts "p(#{self}) = #{sum}"
    @@partitions_cache[self] = sum
    sum
  end

  def partition
    partitions = [[self]]
    until partitions.empty?
      current = partitions.shift

      yield current

      largest = current.shift
      (current.first || 1).upto(largest / 2) do |i|
        partitions << Array[largest-i, i, *current.dup]
      end
    end
  end
end

class Numeric
  def square?
    s = Math.sqrt self
    s.floor == s
  end
end
