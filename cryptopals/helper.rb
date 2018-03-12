require "#{__dir__}/crypto"

require 'base64'

class Helper
  def self.run(klass)
    klass.new.test
    puts
    time do
      klass.new.solve
    end
  end
end

module Kernel
  def assert(expected, actual)
    if expected == actual
      print '.'
    else
      puts
      puts "Expected #{expected} but got #{actual}"
    end
  end

  def time
    start = Time.now
    yield
    elapsed = Time.now - start
    puts "Elapsed time: #{elapsed * 1000}ms"
  end
end
