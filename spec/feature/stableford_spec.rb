feature 'user has enterd a round' do
  scenario 'round is updated with a Stableford score' do
    sign_up
    record_round
    record_holes
    expect(Round.last.handicap).to eq(28)
    expect(Round.last.stableford).to eq(44)
  end
end
