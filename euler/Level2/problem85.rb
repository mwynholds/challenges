require '../helper'
require 'ostruct'

class Problem85
  def initialize
  end

  def sizes(n, m)
    (1..n).to_a.product((1..m).to_a)
  end

  def rects_slow(n, m)
    sizes(n, m).map { |w, h| (n-w+1)*(m-h+1) }.sum
  end

  def rects_fast(n, m)
    (n*n+n)*(m*m+m)/4
  end

  def rects(n, m)
    rects_fast n, m
  end

  def nearest(max)
    nearest = OpenStruct.new w: 1, h: 1, rects: 1
    current = OpenStruct.new w: 1, h: 1, rects: 1
    while rects(current.h, 1) <= max
      while current.rects < max
        current.w += 1
        current.rects = rects(current.w, current.h)
        nearest = current.dup if (max - current.rects).abs < (max - nearest.rects).abs
      end
      current.h += 1
      current.w = current.h
      current.rects = rects(current.w, current.h)
      nearest = current.dup if (max - current.rects).abs < (max - nearest.rects).abs
    end
    nearest
  end

  def solve
    n = nearest 2_000_000
    puts "SOLUTION: #{n.w * n.h}"
    n = nearest 2_000_000_000
    puts "SOLUTION: #{n.w * n.h}"
  end

  def test
    assert 6, sizes(3, 2).length
    assert 18, rects(3, 2)
    assert 18, rects(2, 3)
    (1..8).to_a.product((1..8).to_a).each do |(n, m)|
      assert rects_slow(n, m), rects_fast(n, m)
    end
    p nearest(100)
  end
end

Problem85.new.test
puts
time { Problem85.new.solve }
