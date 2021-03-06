require 'parallel'
require "#{__dir__}/integer"

class Helper

  def self.sum_divisors(n)
    n.divisors.inject(0, :+)
  end

  def self.bang(n)
    @@bang_cache ||= []
    return @@bang_cache[n] if @@bang_cache[n]

    return 1 if n == 0
    return n * Helper.bang(n-1)
  end

  def self.is_palindrome(s)
    s == s.reverse
  end

  def self.is_pandigital(s)
    return false if s.to_s.length != 9
    chars = s.to_s.split(//).sort
    return chars.join == "123456789"
  end

  def self.is_pandigital2(n)
    found = []
    length = 0
    while n > 0
      digit = n % 10
      # puts "checking digit: #{digit}"
      return false if digit == 0
      return false if found[digit]

      found[digit] = true

      n /= 10
      length += 1
    end

    1.upto(length) do |i|
      return false unless found[i]
    end

    true
  end

  def self.canonical_digits(n)
    n.canonical_digits
  end

  def self.ascii_sum(word)
    sum = 0
    0.upto(word.length - 1) do |i|
      sum += ( word[i] - "A"[0] + 1 )
    end
    sum
  end

end

class Array
  def each_permutation(&block)
    a = []
    self.each do |c|
      a.push(c)
    end
    n = a.length
    p = Array.new(n+1,0)
    i = 1

    block.call(a)

    while i < n do
      if p[i] < i
        j = 0
        j = p[i] if (i % 2) == 1
        t = a[j]
        a[j] = a[i]
        a[i] = t

        p[i] = p[i] + 1
        i = 1

        block.call(a)
      else
        p[i] = 0
        i = i + 1
      end
    end
  end

  def freq
    each_with_object(Hash.new(0)){|key,hash| hash[key] += 1}
  end
end

module Enumerable
  def pmap
    Parallel.map(self) { |o| yield o }
  end

  def pmap_with_index
    Parallel.map_with_index(self) { |o, i| yield o, i }
  end
end

module Kernel
  def assert(expected, actual)
    if expected == actual
      print '.'
    else
      puts
      puts "Expected #{expected} but got #{actual}"
    end
  end

  def time
    start = Time.now
    yield
    elapsed = Time.now - start
    puts "Elapsed time: #{elapsed * 1000}ms"
  end
end
