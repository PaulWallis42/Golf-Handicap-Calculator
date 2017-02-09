describe Round do

  before(:each) do
    User.create(email: 'nick.faldo@sawgrass.com', password: 'golfer', handicap: 0)
    User.first.rounds.create(date: '25/12/2016', course: 'Sawgrass', score: 72)
  end

  let(:user){ User.first }

  it 'can save a new round to the database' do
    date = Date.parse '25/12/2016'
    round = Round.first
    expect(round.date).to eq(date)
    expect(round.course).to eq('Sawgrass')
    expect(round.score).to eq(72)
  end

  it 'has many holes' do
    user = User.first
    round = user.rounds.first
    round.holes.create(par: 3, si: 18, distance: 150, putts: 1, shots: 2)
    expect(Hole.first.par).to eq 3
  end

end
