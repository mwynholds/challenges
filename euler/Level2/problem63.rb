require '../helper'

class Problem63
  def initialize
    @powerful = {}
    (1..40).each do |exp|
      @powerful[exp] = []
      i = 1
      loop do
        pow = i**exp
        len = pow.to_s.length
        @powerful[exp] << pow if len == exp
        break if len > exp
        i += 1
      end
    end
  end

  def solve
    puts @powerful.values.map(&:length).sum
  end

  def test
  end
end

Problem63.new.test
puts
Problem63.new.solve
