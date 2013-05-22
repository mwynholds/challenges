@maze = [ 8, 8, 4, 4, 5,
          4, 9, 6, 4, 8,
          8, 6, 4, 1, 2,
          4, 8, 2, 6, 3,
          0, 6, 8, 8, 4  ]
@start = [0, 4]
@end = [4, 0]
@coins = 35

def visited?(path, coords)
  path.include? coords
end

def moves_available(path)
  moves = []

  x = path.last[0]
  y = path.last[1]

  moves << [x+1, y  ] if x < 4
  moves << [x-1, y  ] if x > 0
  moves << [x,   y+1] if y < 4
  moves << [x,   y-1] if y > 0
  moves

  #moves.sort do |a, b|
    #va = visited?(path, a) ? 1 : 0
    #vb = visited?(path, b) ? 1 : 0
    #va - vb
  #end
end

def index_for(coords)
  x = coords[0]
  y = coords[1]
  x + ( 5 * y )
end

def coins_at(coords)
  @maze[index_for(coords)]
end

def total_coins(path)
  path.map {|c| coins_at c}.reduce(:+)
end

def solve(path)
  coins = total_coins path
  return if coins > @coins
  if coins == @coins && path.last == @end
    puts "Victory!"
    p path
    return
  end

  moves = moves_available path
  return if moves.empty?

  moves.each do |move|
    path.push move
    solve path
    path.pop
  end
end

path = [@start]
solve path
