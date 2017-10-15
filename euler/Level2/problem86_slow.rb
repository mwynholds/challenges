require '../helper'
require 'ostruct'

class Problem86
  def initialize
  end

  def min(a, b, c)
    m1 = Math.sqrt( (a+b)**2 + c**2 )
    #m2 = Math.sqrt( a**2 + (b+c)**2 )
    #[ m1, m2 ].min
    m1
  end

  def edges(n)
    diag = (1..n).map { |i| [i, i] }
    rest = (1..n).to_a.combination(2).to_a
    (diag + rest).map { |(a, b)| [a, b, n] }
  end

  def solve_upto(n)
    ints = []
    int = 0
    i = 0
    while int < n
      i += 1
      edges(i).each do |(a, b, c)|
        m = min a, b, c
        if m == m.to_i
          ints << [a, b, c, m]
          int += 1
        end
      end
      puts "#{i}: #{int}"
    end
    ints.sort_by { |(_, _, _, m)| m }.each do |(a, b, c, m)|
      s = a+b+c
      slope = Rational(a+b, c)
      puts sprintf("%3d, %3d, %3d   %4d  -  %3d : %3d : %s", a, b, c, s, m, s-m, slope)
    end
    puts "#{i} : #{int}"
    i
  end

  def solve
    #solve_upto(1_000_000)
  end

  def test
    solve_upto 100
    #assert 100, solve_upto(2000)
  end
end

Problem86.new.test
puts
time { Problem86.new.solve }
