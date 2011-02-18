class Problem24

  def solve
    perm("", %w[0 1 2 3 4 5 6 7 8 9], 0)
  end

  def perm(cur, left, count)
    if left.empty?
      count2 = count + 1
      #puts "#{count2}: #{cur}"
      puts "SOLUTION: #{cur}" if count2 == 1000000
      return count2
    end

    count2 = count
    left.each_with_index do |d, i|
      cur2 = cur + d
      left2 = left.dup
      left2.delete_at i
      count2 = perm(cur2, left2, count2)
    end

    count2
  end

end

Problem24.new.solve