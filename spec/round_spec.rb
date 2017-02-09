describe Round do

  it 'can save a new round to the database' do
    user = User.create(email: 'nick.faldo@sawgrass.com', password: 'golfer', handicap: 0)
    user.rounds.create(date: '25/12/2016', course: 'Sawgrass', score: 72)
    date = Date.parse '25/12/2016'
    round = Round.first
    expect(round.date).to eq(date)
    expect(round.course).to eq('Sawgrass')
    expect(round.score).to eq(72)
  end

end
