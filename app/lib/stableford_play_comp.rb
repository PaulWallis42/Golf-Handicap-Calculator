require_relative 'competition'

class StablefordPlayComp < Competition

  def self.get_winner
    grouped_array = @selected_rounds.group_by do |round|
      round.stableford
    end
    max_score_array = grouped_array.max
    max_score_array.slice!(0)
    return max_score_array
  end

end
