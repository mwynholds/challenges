@a = 69069
@c = 1
@m = 2**32

def f(x)
  (@a * x + @c) % @m
end

class Array
  def mod36
    self.map { |x| x % 36 }
  end
end

seq = [6]
while seq.length < 20
  seq << f(seq.last)
end
p seq
p seq.mod36
