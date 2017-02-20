class Handicap

  DEFAULT_PAR = 70

  def self.calculate(user)
    score_array = []
    rounds = user.rounds.all
    rounds.each { |round| score_array << round.score }
    total_score = score_array.inject{ |sum, x| sum + x }
    handicap = (total_score / rounds.length).floor - DEFAULT_PAR
  end

end
