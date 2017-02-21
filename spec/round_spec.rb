describe Round do

  before(:each) do
    sign_up
    record_round
  end

#  let(:user){ User.first }

  it 'can save a new round to the database' do
    date = Date.parse '14/02/2017'
    round = Round.first
    expect(round.date).to eq(date)
    expect(round.course).to eq('Oak Park')
    expect(round.score).to eq(95)
  end

  it 'has holes' do
    user = User.first
    round = user.rounds.first
    round.holes.create(par: 3, si: 18, distance: 150, putts: 1, shots: 2)
    expect(Hole.first.par).to eq 3
  end

  it 'saves the users handicap to the round' do
    expect(Round.first.handicap).to eq(28)
  end

end
