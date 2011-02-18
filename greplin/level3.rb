class Array
  def subsets
    subs = []
    1.upto(self.length) do |i|
      subs += self.combination(i).to_a
    end
    subs
  end
end

numbers = [3, 4, 9, 14, 15, 19, 28, 37, 47, 50, 54, 56, 59, 61, 70, 73, 78, 81, 92, 95, 97, 99]
length = numbers.length

count = 0
length.downto(2) do |i|
  total = numbers[i-1]
  rest = numbers[0, i-1]
  subsets = rest.subsets

  subsets.each do |subset|
    #puts "subset: #{subset.join(' ')}"
    if subset.reduce(&:+) == total
      puts "#{total} = #{subset.join(' + ')}"
      count += 1
    end
  end
end

puts
puts "TOTAL: #{count}"