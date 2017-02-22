require_relative 'competition'

class StablefordPlayComp < Competition

  def self.get_winner
    @selected_rounds.max_by do |round|
      round.stableford
    end
  end

end
