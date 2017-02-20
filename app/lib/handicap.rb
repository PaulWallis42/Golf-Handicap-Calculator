class Handicap

  DEFAULT_PAR = 70

  def self.calculate(user)
    rounds = user.rounds.all
    total_score = rounds.inject{ |sum, x| sum + x }
    handicap = (total_score / rounds.length).floor - (DEFAULT_PAR)
  end

end
