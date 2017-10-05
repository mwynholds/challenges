require '../helper'
require 'ostruct'

class Problem84
  GO   = 0
  CC1  = 2
  R1   = 5
  CH1  = 7
  JAIL = 10
  C1   = 11
  U1   = 12
  R2   = 15
  CC2  = 17
  CH2  = 22
  E3   = 24
  R3   = 25
  U2   = 28
  G2J  = 30
  CC3  = 33
  R4   = 35
  CH3  = 36
  H2   = 39

  def initialize
    @board = Array.new(40, 0)
    @turns = 0
    @recent_rolls = []
    @recent_scores = []
    @cur = 0
  end

  def roll(d)
    [ rand(d) + 1, rand(d) + 1 ]
  end

  def turn(d)
    @turns += 1
    dice = roll d
    @recent_rolls << dice
    @recent_rolls = @recent_rolls.last(3)
    move dice.sum
    @board[@cur] += 1
  end

  def move(squares)
    if third_double?
      @cur = JAIL
      return
    end

    @cur = ( @cur + squares ) % @board.length
    handle_special
  end

  def handle_special
    if @cur == G2J
      @cur = JAIL
    end

    if @cur == CC1 || @cur == CC2 || @cur == CC3
      cc_card = rand 16 + 1
      case cc_card
        when 1 then @cur = GO
        when 2 then @cur = JAIL
      end
    end

    if @cur == CH1 || @cur == CH2 || @cur == CH3
      ch_card = rand(16) + 1
      case ch_card
        when 1  then @cur = GO
        when 2  then @cur = JAIL
        when 3  then @cur = C1
        when 4  then @cur = E3
        when 5  then @cur = H2
        when 6  then @cur = R1
        when 7  then @cur = next_r
        when 8  then @cur = next_r
        when 9  then @cur = next_u
        when 10 then ( @cur = (@cur - 3) % 40 ; handle_special )
      end
    end
  end

  def third_double?
    @recent_rolls.all? { |d| d[0] == d[1] }
  end

  def next_r
    return R1 if @cur > R4
    return R4 if @cur > R3
    return R3 if @cur > R2
    return R2 if @cur > R1
    R1
  end

  def next_u
    return U1 if @cur > U2
    return U2 if @cur > U1
    U1
  end

  def play_until_stable(d)
    stability = 5
    while @recent_scores.length < stability || ! stable
      play 1_000_000, d
      @recent_scores = @recent_scores.last(stability)
      puts @recent_scores.uniq.length
    end
  end

  def play(turns, d)
    turns.times { turn d }
    scores = @board.map { |c| ( ( c * 1.0 / @turns ) * 10000 ).round }
    @recent_scores << scores
    scores
  end

  def stable
    @recent_scores.uniq.length == 1
  end

  def top3
    @recent_scores.first.map.with_index.sort.reverse.first(3).map(&:last).map { |i| sprintf "%02d", i }.join("")
  end

  def solve
    play_until_stable(4)
    puts top3
  end

  def close_enough(target, n)
    return target if (target-n).abs <= 3
    n
  end

  def test
    @recent_rolls = [ [1,1], [3,3], [2,2] ]
    assert true, third_double?
    @recent_rolls = [ [1,1], [3,4], [2,2] ]
    assert false, third_double?
    scores = play(5_000_000, 6)
    assert 624, close_enough( 624, scores[JAIL] )
    assert 318, close_enough( 318, scores[E3] )
    assert 309, close_enough( 309, scores[GO] )
    assert "102400", top3
  end
end

Problem84.new.test
puts
Problem84.new.solve
