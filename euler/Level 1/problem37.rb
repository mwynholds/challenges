require '../helper'

class Problem37

  def solve
    total = 0
    found = 0
    n = 10
    while found < 11
      if is_super_prime(n)
        puts "#{n}"
        found += 1
        total += n
      end
      n += 1
    end

    puts "total: #{total}"
  end

  def is_super_prime(n)
    s = n.to_s
    r1(s) && r2(s)
  end

  def r1(s)
    return true if s.empty?
    return false unless Helper.is_prime(s.to_i)
    return r1(s.chop)
  end

  def r2(s)
    return true if s.empty?
    return false unless Helper.is_prime(s.to_i)
    return r2(s.reverse.chop.reverse)
  end

end

Problem37.new.solve