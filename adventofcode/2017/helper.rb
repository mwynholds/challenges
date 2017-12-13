module Kernel
  def assert(expected, actual)
    if expected == actual
      print '.'
    else
      puts
      puts "Expected #{expected} but got #{actual}"
    end
  end
end
