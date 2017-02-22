require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'rack-flash'
require 'bcrypt'
require './app/lib/handicap'
require './app/lib/stableford'
require './app/lib/stroke_play_comp'
require './app/lib/stableford_play_comp'
require './app/lib/three_putt_comp'

class ControlHelper

  def self.competition_winners(round)
    comp_hash = {}
    comp_hash[:winning_round_stroke] = StrokePlayComp.winner(round)
    if comp_hash[:winning_round_stroke]
      comp_hash[:winning_round_stableford] = StablefordPlayComp.winner(round)
      comp_hash[:winning_round_three_putt] = ThreePuttComp.winner(round)
      comp_hash[:winning_user_stableford] = User.first(id: comp_hash[:winning_round_stableford].user_id)
      comp_hash[:winning_user_stroke] = User.first(id: comp_hash[:winning_round_stroke].user_id)
      comp_hash[:winning_user_three_putt] = User.first(id: comp_hash[:winning_round_three_putt].user_id)
      comp_hash[:three_putt_total] = ThreePuttComp.get_three_putts(comp_hash[:winning_round_three_putt])
    end
    return comp_hash
  end


end
