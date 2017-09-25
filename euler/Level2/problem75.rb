require '../helper'

# For reference see https://en.wikipedia.org/wiki/Formulas_for_generating_Pythagorean_triples
#
# and look for section "A Ternary Tree: Generating All Primitive Pythagorean Triples"

class Problem75

  def initialize
  end

  def triangle_for(box)
    [ 2 * box[1] * box[2],
      box[0] * box[3],
      box[0] * box[2] + box[1] * box[3] ].sort
  end

  def calc_upto(max)
    triangles = Array.new(max+1).fill { [] }
    initial = [1, 1, 2, 3]
    tree_for initial, max, triangles
    triangles
  end

  def tree_for(box, max, agg)
    t = triangle_for box
    multiples_for t, max, agg
    return if t.sum > max
    agg[t.sum] << t
    x = box[0]
    y = box[3]
    tree_for child1(x, y), max, agg
    tree_for child2(x, y), max, agg
    tree_for child3(x, y), max, agg
  end

  def multiples_for(triangle, max, agg)
    mult = 2
    loop do
      t = triangle.map { |s| s*mult }
      break if t.sum > max
      agg[t.sum] << t
      mult += 1
    end
  end

  def child1(x, y)
    [ x, y-x, y, 2*y-x ]
  end

  def child2(x, y)
    [ y, x, x+y, 2*x+y ]
  end

  def child3(x, y)
    [ x, y, x+y, 2*y+x ]
  end

  def solve
    lengths = calc_upto(1_500_000)
    ones = lengths.count { |l| l.length == 1 }
    puts "Total lengths with one solution: #{ones}"
  end

  def test
    lengths = calc_upto 120
    assert [[3,4,5]], lengths[12]
    assert [[30,40,50], [20,48,52], [24,45,51]], lengths[120]
  end
end

Problem75.new.test
puts
Problem75.new.solve
