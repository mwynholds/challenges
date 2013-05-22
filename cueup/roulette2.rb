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

goal = [34, 27, 16, 1, 34, 31, 24, 17, 34, 35, 16, 13]
#max = goal.length + 1
max = 999999999999

seed = -1
while true
  puts "seed: #{seed}" if seed % 100000 == 0
  seed += 1
  count = 0
  seq = [seed]
  while count < max
    count += 1
    puts "count: #{count}" if count % 1000000 == 0
    seq << f(seq.last)
    if seq.length >= goal.length
      seq = seq.last goal.length
      #p seq.mod36 if seed % 100000 == 0
      if seq.mod36 == goal
        seq << f(seq.last) << f(seq.last) << f(seq.last)
        puts "Victory! (seed: #{seed})"
        p seq.mod36
        exit
      end
    end
  end
end
