require 'bigdecimal'

class Problem113

  def initialize
    @digits = 9
    @cache = {}
    @non_zeros = 0
  end

  def solve
    up = valid_up(0, @digits) - 1

    @cache = {}
    down = valid_down(0, @digits) - 1

    overflow = 9 * @digits
    total = up + down - overflow
    #puts "#{up} + #{down} - #{overflow} = #{total}"
    puts total
  end

  def valid_up(first_digit, left)
    return 10 - first_digit if left == 1

    ci = "#{first_digit}-#{left}"
    sum = @cache[ci]
    return sum if sum

    sum = 0
    (first_digit.upto(9)).each do |i|
      sum += valid_up(i, left-1)
    end

    @cache[ci] = sum
    sum
  end

  def valid_down(first_digit, left)
    return first_digit == 0 && @non_zeros == 0 ? 10 : first_digit + 1 if left == 1

    @non_zeros += 1 unless first_digit == 0

    all_zeros = @non_zeros == 0
    ci = "#{first_digit}-#{left}-#{all_zeros ? 1 : 0}"
    sum = @cache[ci]
    if sum
      @non_zeros -= 1 unless first_digit == 0
      return sum
    end

    sum = 0
    range = all_zeros ? 9.downto(0) : first_digit.downto(0)
    range.each do |i|
      sum += valid_down(i, left-1)
    end

    @cache[ci] = sum
    @non_zeros -= 1 unless first_digit == 0
    sum
  end

end

time1 = Time.now
10.times { Problem113.new.solve }
time2 = Time.now
puts "Time: #{time2.to_f - time1.to_f}s"