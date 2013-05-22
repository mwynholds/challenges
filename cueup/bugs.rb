#!/usr/bin/env ruby

data = DATA.readlines.map(&:chomp).join
puts data

openers = []
data.each_char.with_index do |c, i|
  if c =~ /[\[\{\(]/
    openers.push c
  else
    opener = openers.pop
    unless opener
      puts "oops: #{i}"
      break
    end
    unless (c.ord - opener.ord).abs <= 2
      puts "uh oh: #{i}"
      break
    end
  end
end

#({})}()
#{]
__END__
{{[{{{{}}{{}}}[]}[][{}][({[((
{{[][()()]}}{[{{{}}}]}))][()]
{[[{((()))({}(())[][])}][]()]
}{()[()]}]})][]]}{{}[]}}
