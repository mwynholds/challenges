require '../primes'

class Problem51

  GOAL = 8

  def find_primes(p, ind)
    s = p.to_s
    (0..9).map do |n|
      ind.each { |i| s[i] = n.to_s }
      s.to_i
    end.select do |num|
      num.to_i.to_s.length == s.length && num.prime?
    end
  end

  def find_permut(p)
    length = p.to_s.length
    indices = (0...length).to_a
    comb = (1..length).inject([]) do |memo, len|
      memo += indices.combination(len).to_a
    end
    max = comb.max_by { |ind| find_primes(p, ind).length }
    find_primes p, max
  end

  def solve
    p = 7
    permut = []
    while permut.length < GOAL
      p = p.next_prime
      permut = find_permut p
    end
    puts p
    p permut
  end
end

Problem51.new.solve
