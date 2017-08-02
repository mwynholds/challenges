require '../helper'

class Problem62
  def initialize
    @cubes = {}
    (1..10000).each do |i|
      cube = i**3
      canon = cube.to_s.split('').sort.join('')
      @cubes[canon] ||= []
      @cubes[canon] << cube
    end
  end

  def solve
    p @cubes.values.select { |cubes| cubes.length == 5 }.min_by { |cubes| cubes[0] }
  end

  def test
  end
end

Problem62.new.test
puts
Problem62.new.solve
