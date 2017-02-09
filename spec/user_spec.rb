describe User do

  before(:each) do
    User.create(email: 'nick.faldo@sawgrass.com', password: 'golfer', handicap: 0)
  end

  let(:user){ User.first }

  it 'can save a new user to the database' do
    expect(user.email).to eq('nick.faldo@sawgrass.com')
    expect(user.password).to eq('golfer')
    expect(user.handicap).to eq(0)
  end

  it 'has many rounds' do
    user.rounds.create(date: '25/12/2016', course: 'Sawgrass', score: 72)
    expect(user.rounds.first.course).to eq 'Sawgrass'
  end

end
