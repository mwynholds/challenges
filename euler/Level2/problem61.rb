require '../helper'
require '../primes'

class Problem61
  def initialize
    @figurates = []
  end

  def init(a)
    @figurates[a] = {}
    n = 0
    loop do
      f = figurate a, n
      return if f >= 10000
      @figurates[a][f] = n
      n += 1
    end
  end

  def figurate(a, n)
    n * ( (a-2)*n + 4 - a ) / 2
  end

  def last(cycles)
    "#{sprintf('%04d', cycles.last)[2..3]}#{sprintf('%04d', cycles.first)[0..1]}".to_i
  end

  def middles(cycles)
    s = sprintf("%04d", cycles.compact.last)[2..3].to_i
    ("#{s}00".to_i.."#{s}99".to_i).reject { |i| i % 100 < 10 }
  end

  def cyclic(n, cycles, op)
    #p cycles if cycles.length == n
    return op.call(cycles) if cycles.length == n

    #print cycles[0] if cycles.length == 1

    if cycles.length == 0
      (1000..9999).reject { |i| i % 100 < 10 }.select { |i| a_for(i).length > 0 }.each { |i| cyclic n, cycles + [i], op }
    elsif cycles.length == n-1
      cyclic(n, cycles + [last(cycles)], op) if a_for(last(cycles))
    else
      middles(cycles).select { |i| a_for(i).length > 0 }.each { |i| cyclic n, cycles + [i], op }
    end
  end

  def a_for(fig)
    @figurates.map.with_index { |figs,a| figs && figs[fig] ? a : nil }.compact
  end

  def covers?(range, as)
    return false unless as.all? { |a| a.length > 0 }
    return false unless as.uniq == as
    true
  end

  def success?(n, cycles)
    return false unless cycles.min == cycles.first

    as = cycles.map { |f| a_for f }
    covers = covers? (3..3+n-1), as
    #p as if covers
    covers
  end

  def solution(n)
    count = 0
    op = Proc.new do |cycles|
      count += 1
      print '.' if count % 10000 == 0
      if success? n, cycles
        #puts "#{cycles} - #{cycles.sum}"
        return cycles
      end
    end
    cyclic n, [], op
  end

  def solve
    (3..8).each { |a| init a }
    s = solution 6
    puts
    puts "#{s} - #{s.sum}"
  end

  def test
    (3..5).each { |a| init a }

    assert 8128, figurate(3, 127)
    assert 2882, figurate(5, 44)
    assert 8281, figurate(4, 91)
    assert 300, last([0002, 0003])
    assert 7812, last([1234, 5678])
    #assert (200..299), middles([0002])
    #assert (3400..3499), middles([1234])
    assert [2882, 8281, 8128], solution(3)
  end
end

Problem61.new.test
puts
Problem61.new.solve
