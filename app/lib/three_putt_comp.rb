require_relative 'competition'

class ThreePuttComp < Competition

  def self.get_winner
    rounds_by_count = @selected_rounds.group_by do |round|
      round.holes.count(:putts.gt => 2)
    end
    most_three_putts = rounds_by_count.max
    @three_putt_total = most_three_putts.slice!(0)
    return most_three_putts
  end

  def self.get_three_putts
    @three_putt_total
  end

end
