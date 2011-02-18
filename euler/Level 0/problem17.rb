class Problem17

  def initialize
    @w = { 0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",
           10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen",
           17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty",
           60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety", 100 => "hundred" }
  end

  def solve
#    puts word(287)
#    puts word(51)
#    puts word(17)
#    puts word(1000)
#    puts word(2)

    letters = 0
    1.upto(1000) do |i|
      puts(word(i))
      letters += word(i).length
    end

    puts letters
  end

  def word(n)
    return "" if n == 0
    return @w[n] if n <= 20

    if n < 100
      tens = (n / 10) * 10
      return @w[tens] + word(n - tens)
    end

    if n < 1000
      hundreds = (n / 100) * 100
      leftover = n - hundreds
      return @w[hundreds / 100] + "hundred" + ( leftover > 0 ? "and" + word(n - hundreds) : "" )
    end

    return "onethousand"
  end

end

Problem17.new.solve