require_relative 'competition'

class ThreePuttComp < Competition

  def self.get_winner
    @selected_rounds.max_by do |round|
      round.holes.count(:putts.gt => 2)
    end
  end

  def self.get_three_putts(round)
    i = 0
    round.holes.each do |hole|
      if hole.putts > 2
        i += 1
      end
    end
    return i
  end

end
