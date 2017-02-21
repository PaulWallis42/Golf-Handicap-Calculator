class Stableford

  def self.calculate(user)
    round = user.rounds.last
    handicap = round.handicap
    holes = round.holes.all
    net_shots_calculator(holes)
    score_calculator(holes)
  end

  def self.net_shots_calculator(holes)
    holes.each do |hole|
      if handicap == 18
        hole.shots -= 1
      elsif handicap < 18
        (1..handicap).each do |i|
          if i == hole.si
            hole.shots -= 1
          end
        end
      else
        (19..handicap).each do |i|
          if i - 18 == hole.si
            hole.shots -= 2
          end
        end
      end
    end
  end

  def self.score_calculator(holes)
    final_score = 0
    holes.each do |hole|
      if hole.shots - 1 == hole.par
        final_score += 1
      elsif hole.shots == hole.par
        final_score += 2
      elsif hole.shots + 1 == hole.par
        final_score += 3
      elsif hole.shots + 2 == hole.par
        final_score += 4
      end
    end
    return final_score
  end

end
