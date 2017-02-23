require_relative 'competition'

class StrokePlayComp < Competition

  def self.get_winner
    grouped_array = @selected_rounds.group_by do |round|
      round.score
    end
    min_score_array = grouped_array.min
    min_score_array.slice!(0)
    return min_score_array
  end

end
