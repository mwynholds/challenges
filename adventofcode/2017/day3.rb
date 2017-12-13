require './helper'

class Day3

  def nxt(pair)
    (x, y) = pair
    max = [x.abs, y.abs].max
    return [x+1, y] if y == -max
    return [x, y-1] if x == -max
    return [x-1, y] if y == max
    return [x, y+1] if x == max
    throw 'wut?'
  end

  def nxt_chain(pair, n)
    chain = [ pair ]
    (n-1).times { chain << nxt(chain.last) }
    chain
  end

  def prv(pair)
    (x, y) = pair
    max = [x.abs, y.abs].max
    return [x-1, y] if x > 0 && ( x == -y || x == -y + 1 )
    return [x, y-1] if x == max
    return [x+1, y] if y == max
    return [x, y+1] if x == -max
    return [x-1, y] if y == -max
    throw 'wut?'
  end

  def prv_chain(pair, n)
    chain = [ pair ]
    (n-1).times { chain << prv(chain.last) }
    chain
  end

  def solve1(n)
    pair = [0, 0]
    i = 1
    while i < n
      pair = nxt pair
      i += 1
    end
    pair[0].abs + pair[1].abs
  end

  def solve2(n)
    pair = [0, 0]
    val = 1
    cache = { key(pair) => val }
    while val < n
      pair = nxt pair
      val = calc2 pair, cache
      cache[key(pair)] = val
    end
    val
  end

  def square2(n)
    pair = [0, 0]
    val = 1
    cache = { key(pair) => val }
    i = 1
    while i < n
      pair = nxt pair
      val = calc2 pair, cache
      cache[key(pair)] = val
      i += 1
    end
    val
  end

  def key(pair)
    "#{pair[0]},#{pair[1]}"
  end

  def calc2(pair, cache)
    (x, y) = pair
    adjacent = [ [x, y+1], [x+1, y+1], [x+1, y], [x+1, y-1], [x, y-1], [x-1, y-1], [x-1, y], [x-1, y+1] ]
    adjacent.map { |a| cache[key(a)] || 0 }.sum
  end

  def solve
    puts solve1 277678
    puts solve2 277678
  end

  def test
    chain = [ [0, 0], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1], [0, -1], [1, -1], [2, -1], [2, 0] ]
    assert chain, nxt_chain([0, 0], 11)
    assert chain.reverse, prv_chain([2, 0], 11)
    assert 0, solve1(1)
    assert 3, solve1(12)
    assert 2, solve1(23)
    assert 31, solve1(1024)
    assert 1, square2(1)
    assert 1, square2(2)
    assert 2, square2(3)
    assert 4, square2(4)
    assert 5, square2(5)
  end

end

Day3.new.test
puts
Day3.new.solve
