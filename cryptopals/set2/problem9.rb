require '../helper'

class Problem9
  def test
  end

  def solve
    message = Message.new binary: "YELLOW SUBMARINE"
    assert "YELLOW SUBMARINE000000000000000000000000000000000000000000000000", message.pad(16+48)
    assert "YELLOW SUBMARINE\x04\x04\x04\x04", message.pad(20)
  end
end

Helper.run Problem9
