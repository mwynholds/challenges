require '../helper'

class Problem79

  @@codes = DATA.readlines.sort.uniq.map(&:to_i)

  def initialize
  end

  def valid?(n)
    @@codes.all? { |code| valid_one? n, code }
  end

  def valid_one?(n, code)
    digit = code % 10

    while n > 0 && code > 0
      i = n % 10
      return false if i == 4 || i == 5 # skip these
      if digit == i
        code /= 10
        digit = code % 10
      end
      n /= 10
    end

    code == 0
  end

  def solve
    n = 1000
    loop do
      print '.' if n % 100000 == 0
      if valid? n
        puts
        puts "SOLUTION: #{n}"
        break
      end
      n += 1
    end
  end

  def test
    assert true,  valid_one?(3947563202, 450)
    assert true,  valid_one?(3947563202, 322)
    assert false, valid_one?(3947563202, 457)
    assert false, valid_one?(3947563202, 850)
  end
end

Problem79.new.test
puts
Problem79.new.solve

__END__
319
680
180
690
129
620
762
689
762
318
368
710
720
710
629
168
160
689
716
731
736
729
316
729
729
710
769
290
719
680
318
389
162
289
162
718
729
319
790
680
890
362
319
760
316
729
380
319
728
716
