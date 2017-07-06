require '../helper'

class Problem49
  def solve
    (1000..9999).each do |i|
      if i.prime?
        j = i + 3330
        k = j + 3330
        if j.prime? && k.prime? &&
           Helper.canonical_digits(i) == Helper.canonical_digits(j) &&
           Helper.canonical_digits(i) == Helper.canonical_digits(k)
          puts "#{i} #{j} #{k}"
        end
      end
    end
  end
end

Problem49.new.solve
