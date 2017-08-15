class ContinuedFraction
  def initialize(n)
    @n = n
  end

  def first
    Math.sqrt(@n).floor
  end

  def expansion
    Enumerator.new do |yielder|
      a = first
      b = 1
      c = a

      loop do
        x = b
        y = c
        z = @n - c**2

        b = z / x
        a = 0
        c = y
        loop do
          a += 1
          c -= b
          break if (c-b)**2 > @n
        end
        c = -c

        yielder << a
      end
    end
  end

  def convergents
    Enumerator.new do |yielder|
      exp = expansion
      a = Rational(1, exp.next)

      loop do
        yielder << Rational(first) + a
        a = Rational(1, exp.next + a)
      end
    end
  end
end
