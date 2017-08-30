require '../helper'

class Problem74

  def initialize
  end

  def chain(n)
    map = { n => true }
    fs = n.fact_sum
    while ! map[fs]
      map[fs] = true
      fs = fs.fact_sum
    end
    map.keys
  end

  def solve
    sixties = (1..1_000_000).pmap do |n|
      print '.' if n % 10_000 == 0
      c = chain n
      c.length == 60 ? n : nil
    end.compact
    puts sixties.length
  end

  def test
    assert [145], chain(145)
    assert [69, 363600, 1454, 169, 363601], chain(69)
    assert [78, 45360, 871, 45361], chain(78)
    assert [540, 145], chain(540)
  end
end

Problem74.new.test
puts
Problem74.new.solve
