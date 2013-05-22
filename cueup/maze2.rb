@maze = [
0, 8, 1, 7, 8, 8, 5, 2, 9, 5, 9, 5,
8, 5, 1, 1, 5, 6, 9, 4, 4, 5, 2, 1,
7, 2, 3, 5, 2, 9, 2, 6, 9, 3, 9, 4,
9, 2, 5, 9, 8, 9, 5, 7, 7, 5, 9, 6,
2, 4, 6, 7, 1, 4, 2, 6, 6, 2, 5, 8,
2, 8, 1, 5, 3, 8, 4, 9, 7, 5, 2, 3,
2, 9, 3, 5, 6, 7, 2, 4, 9, 4, 2, 5,
6, 3, 1, 7, 8, 2, 3, 3, 6, 7, 9, 3,
2, 5, 7, 4, 2, 7, 8, 5, 5, 3, 5, 8,
5, 2, 9, 8, 3, 6, 1, 4, 9, 5, 6, 3,
4, 6, 9, 8, 5, 4, 9, 7, 6, 4, 6, 8,
2, 7, 7, 1, 9, 9, 7, 3, 7, 2, 2, 5
]
@size = 12
@start = [0, 0]
@end = [11, 11]
@coins = 444

def visited?(path, coords)
  path.include? coords
end

def moves_available(path)
  moves = []

  x = path.last[0]
  y = path.last[1]

  moves << [x+1, y  ] if x < @size - 1
  moves << [x-1, y  ] if x > 0
  moves << [x,   y+1] if y < @size - 1
  moves << [x,   y-1] if y > 0

  moves.select { |coords| ! visited?(path, coords) }
  #moves.sort do |a, b|
    #va = visited?(path, a) ? 1 : 0
    #vb = visited?(path, b) ? 1 : 0
    #if va == vb
      #coins_at(a, 0) - coins_at(b, 0)
    #else
      #va - vb
    #end
  #end
end

def index_for(coords)
  x = coords[0]
  y = coords[1]
  x + ( @size * y )
end

def coins_at(coords, i)
  coins = @maze[index_for(coords)]
  return coins if coords == @end || coords == @start
  coins + (i - 1)
end

def total_coins(path)
  path.map.with_index {|c, i| coins_at c, i}.reduce(:+)
end

def solve(path)
  coins = total_coins path
  #print "#{coins}: "
  #p path
  return if coins > @coins
  if coins == @coins && path.last == @end
    puts "Victory! (coins: #{coins})"
    p path
    exit
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
