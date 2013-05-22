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

  def contains?(arr)
    each.with_index do |x, i|
      if x == arr.first
        return i if arr == self[i, arr.length]
      end
    end
    nil
  end
end

def seq(seed, offset, length)
  seq = [seed]
  (offset + length).times { seq << f(seq.last) }
  seq[offset..-1].mod36
end

def check(seed, max, goal)
  s = seq seed, 0, max
  i = s.contains? goal
  if i
    puts
    puts "Victory at seed: #{seed}, index: #{i}"
    p s[i, goal.length + 3]
  end
end

goal = [34, 27, 16, 1, 34, 31, 24, 17, 34, 35, 16, 13]
print "Goal: "
p goal

max = 1000000
up = 0
down = 0
while true
  check up, max, goal
  check down, max, goal
  up += 1
  down -= 1
  print '.'
end
