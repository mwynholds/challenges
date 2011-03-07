class Fixnum
  def prime?
    return false if self == 0 || self == 1

    sqrt = Math.sqrt(abs).to_i
    2.upto(sqrt) do |i|
      return false if self % i == 0
    end

    true
  end
end

File.open './puzzle2.txt', 'r' do |file|
  line = file.gets.strip
  nums = {}
  line.scan /\d+/ do |n|
    if nums[n] && n.to_i.prime?
      puts n
    else
      nums[n] = true
    end
  end
end