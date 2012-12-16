require 'rational'

class Problem33

  def solve
    num = 1
    den = 1

    10.upto(99) do |i|
      10.upto(99) do |j|
        r2 = fraction(i, j)
        if r2
          r1 = Rational(i, j)
          if r1 == r2
            puts "#{i}, #{j} = #{r1} : #{r2}"
            num *= i
            den *= j
          end
        end
      end
    end

    r = Rational(num, den)
    puts r
  end

  def fraction(i, j)
    return nil if i % 10 == 0 && j % 10 == 0
    return nil if j % 10 == 0
    return nil if i >= j

    dmi = i.divmod(10)
    dmj = j.divmod(10)
    return Rational(dmi[1], dmj[1]) if dmi[0] == dmj[0]
    return Rational(dmi[1], dmj[0]) if dmi[0] == dmj[1]
    return Rational(dmi[0], dmj[1]) if dmi[1] == dmj[0]
    return Rational(dmi[0], dmj[0]) if dmi[1] == dmj[1]

    nil
  end

end

Problem33.new.solve