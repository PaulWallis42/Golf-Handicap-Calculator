require_relative 'competition'

class StrokePlayComp < Competition

  def self.get_winner
    @selected_rounds.min_by do |round|
      round.score
    end
  end

end
