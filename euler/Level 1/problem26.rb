require 'bigdecimal'

class Problem26

  def solve
    max = [0, 0]
    1.upto(1000) do |i|
      r = find_repeat(i)
      max = [i, r] if r > max[1]
    end

    puts max[0]
  end


  def find_repeat(i)
    f = bd("1.0") / bd(i)
    digits = f.to_s('F').sub(/^../, "")[0, 5000].reverse
    visible = f.to_s('F')[0, 20]

    if digits.length < 5000
      puts "#{i}: #{visible} - no repeat"
      return 0
    end

    1.upto(1000) do |j|
      match = is_repeat(digits, j)
      if match
        puts "#{i}: #{visible} - recurring pattern: #{match} (#{match.length})"
        return match.length
      end

    end

    puts "#{i}: #{visible} (#{digits[0, 20]}) - no recurring pattern"
    return 0
  end

  def is_repeat(digits, i)
    sub = digits[0, i]
    to_match = sub * 5
    match = digits.match("^#{to_match}")
    if match
      return sub.reverse
    end

    nil
  end

  def bd(n)
    BigDecimal.new(n.to_s, 5001)
  end
end

Problem26.new.solve