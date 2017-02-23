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

  def self.competition_winners(rounds)
    @comp_hash = {}
      winning_round_stroke(rounds)
      winning_round_stableford(rounds)
      winning_round_three_putt(rounds)
      winning_user_stroke
      winning_user_stableford
      winning_user_three_putt
      three_putt_total
    return @comp_hash
  end

  def self.winning_round_stroke(rounds)
    @comp_hash[:winning_round_stroke] = StrokePlayComp.winner(rounds)
  end

  def self.winning_round_stableford(rounds)
    @comp_hash[:winning_round_stableford] = StablefordPlayComp.winner(rounds)
  end

  def self.winning_round_three_putt(rounds)
    @comp_hash[:winning_round_three_putt] = ThreePuttComp.winner(rounds)
  end

  def self.winning_user_stroke
    player_name_array = []
    @comp_hash[:winning_round_stroke][0].each do |round|
      player_name_array << User.first(id: round.user_id).name
    end
    @comp_hash[:winning_user_stroke] = player_name_array
  end

  def self.winning_user_stableford
    player_name_array = []
    @comp_hash[:winning_round_stableford][0].each do |round|
      player_name_array << User.first(id: round.user_id).name
    end
    @comp_hash[:winning_user_stableford] = player_name_array
  end

  def self.winning_user_three_putt
    player_name_array = []
    @comp_hash[:winning_round_three_putt][0].each do |round|
      player_name_array << User.first(id: round.user_id).name
    end
    @comp_hash[:winning_user_three_putt] = player_name_array
  end

  def self.three_putt_total
    @comp_hash[:three_putt_total] = ThreePuttComp.get_three_putts
  end

end
