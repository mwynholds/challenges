require '../helper'

class Problem35

  def solve
    count = 0
    2.upto(1000000) do |n|
      if Helper.is_prime(n)
        circle = circle(n)
        prime = true
        circle.each do |c|
          prime &&= Helper.is_prime(c)
        end

        if prime
          puts "#{n} - #{circle.inspect}"
          count += 1
        end
      end
    end

    puts "total: #{count}"
  end

  def circle(n)
    s = n.to_s.split(//)
    circle = []
    begin
      circle << s.join.to_i
      s << s.shift
    end while s.join.to_i != n
    circle
  end

end

Problem35.new.solve