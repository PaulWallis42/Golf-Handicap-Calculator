describe Hole do

  before(:each) do
    User.create(email: 'nick.faldo@sawgrass.com', password: 'golfer', handicap: 0)
    round = User.first.rounds.create(date: '25/12/2016', course: 'Sawgrass', score: 72)
    round.holes.create(par: 5, si: 15, distance: 520, putts: 3, shots: 6)
  end

  it 'can save a new hole to the database' do
    hole = Hole.first
    expect(hole.par).to eq(5)
    expect(hole.si).to eq(15)
    expect(hole.distance).to eq(520)
    expect(hole.putts).to eq(3)
    expect(hole.shots).to eq(6)
  end

end
