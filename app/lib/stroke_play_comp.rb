class StrokePlayComp

  def self.winner(all_rounds)
    @all_rounds = all_rounds
    @multi_round_date = get_round_date[0]
    @selected_rounds = get_multi_rounds
    get_winner
  end

  def self.get_round_date
    rounds_array = @all_rounds.aggregate(:date, :all.count)
    rounds_array.reverse!
    rounds_array.each do |round|
      if round[1] > 1
        return round
      end
    end
  end

  def self.get_multi_rounds
    @all_rounds.all(date: @multi_round_date)
  end

  def self.get_winner
    @selected_rounds.min_by do |round|
      round.score
    end
  end

end
